pipeline {
    // We can use a special docker agent now
    agent any 

    environment {
        // Your Docker Hub username from before
        DOCKERHUB_USERNAME = 'qaismuhammad081' 
        IMAGE_NAME = "${DOCKERHUB_USERNAME}/my-first-app"
    }

    stages {
        stage('1. Build Docker Image') {
            steps {
                script {
                    // Use the special ${BUILD_NUMBER} variable Jenkins provides
                    // to give each image a unique tag
                    sh "docker build -t ${IMAGE_NAME}:${BUILD_NUMBER} ."
                }
            }
        }
        stage('2. Push to Docker Hub') {
            steps {
                // Use the credentials you stored in Jenkins
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                    sh "echo ${DOCKER_PASSWORD} | docker login -u ${DOCKER_USERNAME} --password-stdin"
                    sh "docker push ${IMAGE_NAME}:${BUILD_NUMBER}"
                }
            }
        }
    }
}