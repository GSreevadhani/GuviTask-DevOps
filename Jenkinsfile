pipeline {
    agent any

    environment {
        DOCKER_USERNAME = credentials('docker-username') // Replace 'docker-username' with your Jenkins credentials ID
        DOCKER_PASSWORD = credentials('docker-password') // Replace 'docker-password' with your Jenkins credentials ID
    }

    stages {
        stage('Build and Push Docker Image') {
            steps {
                // Grant executable permissions to the build script
                sh 'chmod +x deploy.sh'

                // Build the Docker image using the build script
                sh './deploy.sh'

                // Authenticate with Docker Hub
                sh '''
                echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin
                docker push sreevadhani/art:latest
                docker logout
                '''
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                // Authenticate with Kubernetes API
                withCredentials([usernamePassword(credentialsId: 'k8s-credentials', usernameVariable: 'K8S_USER', passwordVariable: 'K8S_PASSWORD')]) {
                    sh '''
                    kubectl config set-credentials $K8S_USER --username=$K8S_USER --password=$K8S_PASSWORD
                    kubectl config set-context --current --user=$K8S_USER
                    kubectl apply -f k8s-deployment.yaml
                    '''
                }
            }
        }
    }
}
