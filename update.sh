#!/bin/sh

version=$1
if [ "$version" = "" ]; then
  echo "version must be provided"
  exit 1
fi

# Pull new image
docker pull lucj/sophia.events:$version

# Stop previous container
docker stop events
docker rm events

# Run new one
docker run -p 80:80 --name events -d lucj/sophia.events:$version
