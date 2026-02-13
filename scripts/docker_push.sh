#!/bin/bash

set -e

DOCKER_USER=$1
BACKEND_IMAGE=$2
FRONTEND_IMAGE=$3
IMAGE_TAG=$4

echo "Pushing Images"


docker push $DOCKER_USER/$BACKEND_IMAGE:$IMAGE_TAG
docker push $DOCKER_USER/$FRONTEND_IMAGE:$IMAGE_TAG

echo "Push Done....................."
