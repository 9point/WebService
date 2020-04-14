#!/bin/bash

PACKAGE_VERSION=$(cat package.json \
  | grep version \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[",]//g' \
  | tr -d '[[:space:]]')

docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD

docker push 9point/webservice:${PACKAGE_VERSION}
docker push 9point/webservice:latest

