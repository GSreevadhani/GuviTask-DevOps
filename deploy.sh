#!/bin/bash
echo hi123
chmod +x build.sh
./build.sh
docker login -u sreevadhani -p "$DOCKER_PASSWORD"
docker tag test sreevadhani/ar
docker push sreevadhani/ar
