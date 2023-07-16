#!/bin/bash

DOKCER_IMAGE_NAME="songrec-rust"

if which docker >/dev/null; then
    echo "Docker is installed"
else
    echo "Docker is not installed"
    exit 1
fi

echo "Building docker image"
docker build -t $DOKCER_IMAGE_NAME .

if [ $? -eq 0 ]; then
    echo "Docker image built successfully"
else
    echo "Docker image build failed"
    exit 1
fi

echo "copy binary from docker image"

docker create --name temp_container $DOKCER_IMAGE_NAME
docker cp temp_container:/app/songrec .
docker rm temp_container

if ls songrec >/dev/null; then
    echo "Binary copied successfully"
else
    echo "Binary copy failed"
    exit 1
fi

echo
echo "============ > Build completed < ============"
echo