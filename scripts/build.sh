#!/bin/bash

PACKAGE_VERSION=$(cat package.json \
  | grep version \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[",]//g' \
  | tr -d '[[:space:]]')

docker build -t 9point/webservice:${PACKAGE_VERSION} -t 9point/webservice:latest .
