#!/bin/bash
set -e

DOCKER_USER=$1
BACKEND_IMAGE=$2
FRONTEND_IMAGE=$3
IMAGE_TAG=$4

echo "Building Docker Images"

docker build -t $DOCKER_USER/$BACKEND_IMAGE:$IMAGE_TAG backend
docker build -t $DOCKER_USER/$FRONTEND_IMAGE:$IMAGE_TAG frontend

echo "Docker build completed"
