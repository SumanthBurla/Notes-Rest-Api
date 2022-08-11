#!/usr/bin/env groovy
pipeline {
    agent {
        node { label 'default' }
    }
    tools {
        dockerTool 'myDocker'
        gradle '7.5.1'
    }
    environment {
        IMAGE_NAME="sburla/notes-api-13ss"
        DOCKERHUB_CREDENTIALS=credentials('DockerID')
    }
    stages {
        stage('Build JAR file'){
            steps{
                sh 'ls'
                sh 'cat ./src/main/resources/application-dev.properties'
                sh 'gradle build'
            }
        }
        stage('Build docker image') {
            steps{
                sh 'ls ./build/libs/'
                buildImage()
        }}
        stage('Dockerhub-login'){
            steps{
                sh 'docker login -u $DOCKERHUB_CREDENTIALS_USR -p $(echo $DOCKERHUB_CREDENTIALS_PSW )'
                // sh 'res=$(echo $?)'
                // sh 'echo $res'
            }
        }
        stage('Push to hub'){
            steps{
               pushImage()
            }
        }
    }
    post {
        always {
            sh('docker logout')
            echo 'displays always --- this is always block from post-build section'
        }
        success {
            deleteDir()
            echo '----- Job Succeeded -----'
        }
        failure {
            deleteDir()
            echo 'displays when failure --- this is failure block from post-build section'
        }
    }
}
def buildImage(){
    sh('docker build -t $IMAGE_NAME:v0.$BUILD_ID .')
    echo "Build complete..."
    sh('docker images')
}

def pushImage(){
    sh('docker push $IMAGE_NAME:v0.$BUILD_ID')
    echo "----- ${IMAGE_NAME} pushed -----"
}