#!/bin/bash
echo hi123
chmod +x build.sh
./build.sh

# Use non-interactive login
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

# Tag and push the image
docker tag test-image sreevadhani/service-tag
docker push sreevadhani/service-tag  

docker pull sreevadhani/service-tag
docker run -d -p 8000:80 --name=my-app-repo sreevadhani/service-tag

kubectl create deployment ar-deploy --image=sreevadhani/service-tag --port 80
kubectl expose deployment ar-deploy --type=NodePort --port=80
