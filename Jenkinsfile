pipeline {
    agent any
    environment {
        DOCKERHUB_USERNAME = 'qaismuhammad081' // Change this to your username
        IMAGE_NAME = "${DOCKERHUB_USERNAME}/my-first-app"
    }
    stages {
        stage('1. Checkout Code') {
            steps {
                git 'https://github.com/qaismuhammad081/jenkins-docker-project.git' // Change this to your repo URL
            }
        }
        stage('2. Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${IMAGE_NAME}:${BUILD_NUMBER} ."
                }
            }
        }
        stage('3. Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                    sh "echo ${DOCKER_PASSWORD} | docker login -u ${DOCKER_USERNAME} --password-stdin"
                    sh "docker push ${IMAGE_NAME}:${BUILD_NUMBER}"
                }
            }
        }
    }
}