#!/bin/bash

# This script gets the latest version of the docker image and starts streaming

cd ~/pi-streamer

echo "Pulling changes"
git pull

echo "Building docker image"
docker build -t kielabokkie/pi-streamer .

echo "Remove old docker container"
docker rm -f cam

echo "Starting Youtube stream"
docker run --privileged --restart always --name cam -d kielabokkie/pi-streamer $YOUTUBE_KEY
