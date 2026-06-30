pipeline {

    agent any

    environment {
        AWS_REGION = "ap-south-1"
        AWS_ACCOUNT_ID = "062000001653"
        IMAGE_NAME = "flask-devops"
        IMAGE = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${IMAGE_NAME}"
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
                docker build -t $IMAGE:$BUILD_NUMBER .
                docker tag $IMAGE:$BUILD_NUMBER $IMAGE:latest
                '''
            }
        }

        stage('Login to ECR') {
            steps {
                sh '''
                aws ecr get-login-password --region $AWS_REGION | \
                docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com
                '''
            }
        }

        stage('Push Image to ECR') {
            steps {
                sh '''
                docker push $IMAGE:$BUILD_NUMBER
                docker push $IMAGE:latest
                '''
            }
        }
    }

    post {
        success {
            echo "Image pushed successfully to Amazon ECR."
        }
    }
}
