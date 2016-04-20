#!/usr/bin/env bash

function putS3
{
  path=$(pwd)
  file="env.file"
  aws_path=$1
  date=$(date +"%a, %d %b %Y %T %z")
  acl="x-amz-acl:public-read"
  content_type='application/json'
  string="PUT\n\n$content_type\n$date\n$acl\n/$AWS_BUCKET$aws_path$file"
  signature=$(echo -en "${string}" | openssl sha1 -hmac "$AWS_SECRET_ACCESS_KEY" -binary | base64)
  curl -X PUT -T "$path/$file" \
    -H "Host: $AWS_BUCKET.s3.amazonaws.com" \
    -H "Date: $date" \
    -H "Content-Type: $content_type" \
    -H "$acl" \
    -H "Authorization: AWS $AWS_ACCESS_KEY_ID:$signature" \
    "https://$AWS_BUCKET.s3.amazonaws.com$aws_path$file"
}

env > env.file
putS3 $1
