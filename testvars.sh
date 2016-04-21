#!/usr/bin/env bash

export DFB_BUILD_ID=$TRAVIS_BUILD_ID
export DFB_PROJECT_DIR=$(pwd)
export DFB_PRODUCT_NAME=$(basename ${DFB_PROJECT_DIR})

export DFB_OWNER_NAME=$(basename )

env | grep DFB_
