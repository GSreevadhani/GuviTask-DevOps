#!/bin/bash
echo hi123
chmod +x build.sh
./build.sh

# Use non-interactive login
echo "$DOCKER_PASSWORD" | docker login -u "sreevadhani" --password-stdin

# Tag and push the image
docker tag test sreevadhani/ar
docker push sreevadhani/ar  

docker pull sreevadhani/ar

docker run -d -p 8000:80 --name test sreevadhani/ar
