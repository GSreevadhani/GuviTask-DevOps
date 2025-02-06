pipeline {
    agent any

    environment {
        DOCKER_USERNAME = credentials('docker-username') // Ensure these credentials exist in Jenkins
        DOCKER_PASSWORD = credentials('docker-password')
    }

    stages {
        stage('Build and Push Docker Image') {
            steps {
                // Grant executable permissions to the build script
                sh 'chmod +x deploy.sh'

                // Authenticate with Docker Hub
                sh '''
                echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin
                ./deploy.sh
                docker logout
                '''
            }
        }
    }
}
