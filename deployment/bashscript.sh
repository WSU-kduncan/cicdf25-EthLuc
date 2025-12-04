#!/bin/bash
set -e

echo "Deployment started"

# variables
CONTAINER_NAME="webcontent"
IMAGE_NAME="ethluc/docker-site:latest"

# stopping
sudo docker stop $CONTAINER_NAME || true

# removing
sudo docker rm $CONTAINER_NAME || true

# pulling
sudo docker pull $IMAGE_NAME 

# starting new
sudo docker run -d --name $CONTAINER_NAME -p 80:80 --restart always $IMAGE_NAME

# checking
sudo docker ps