pipeline {
    agent any

    options {
        timestamps()
        disableConcurrentBuilds()
    }

    environment {
        IMAGE_NAME = "jenkins-docker-image"
        IMAGE_TAG  = "${BUILD_NUMBER}"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                docker build -t $IMAGE_NAME:$IMAGE_TAG .
                '''
            }
        }

        stage('Verify Image') {
            steps {
                sh '''
                docker images | grep $IMAGE_NAME
                '''
            }
        }
    }

    post {
        success {
            echo "Docker image built successfully"
        }
        failure {
            echo "Docker image build failed"
        }
        always {
            cleanWs()
        }
    }
}
