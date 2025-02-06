#!/bin/bash
echo hi123
chmod +x build.sh
./build.sh

# Use non-interactive login
echo "$DOCKER_PASSWORD" | docker login -u "sreevadhani" --password-stdin

# Tag and push the image
docker tag test-image sreevadhani/art
docker push sreevadhani/art  

docker pull sreevadhani/art
docker run -d -p 8000:80 --name=my-app-repo sreevadhani/art
#kubectl create deployment ar-deploy --image=sreevadhani/art --port 80
#kubectl expose deployment ar-deploy --type=NodePort --port=80
