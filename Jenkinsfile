#!/usr/bin/env groovy
pipeline {
    agent {
        node { label 'default' }
    }
    
    environment {
        IMAGE_NAME="sburla/rest-api-13ss"
        DOCKERHUB_CREDENTIALS=credentials('DockerID')
    }
    stages {
        stage('Initialize'){
            steps{
                script{
                    def dockerHome = tool 'myDocker'
                    env.PATH = "${dockerHome}/bin:${env.PATH}"
                    echo "Running ${env.BUILD_ID} job on ${env.JENKINS_URL}"
                }
            }
        } 
        stage('Build') {
            steps{
                sh 'ls ./build/libs/'
                buildImage()
        }}
        stage('random-Execution-stage') {            
            steps{
                sh 'ls'
            }
        }
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