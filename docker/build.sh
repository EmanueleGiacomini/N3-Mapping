#!/bin/sh

# image name
IMAGE_NAME=n3mapping

docker build --build-arg UNAME=$(whoami) --build-arg UID=$(id -u) --build-arg GID=$(id -g) -t ${IMAGE_NAME} .