pipeline {
    agent any 
    environment {
        AWS_REGION = 'us-west-2'
        AWS_DOCKER_REGISTRY = '381492139836.dkr.ecr.us-west-2.amazonaws.com'
        //AWS_ECS_TD = ''
        //ECS_CLUSTER = '' 
        //ECS_SERVICE = '' 
    } 

    stages {
      
        stage('Checkout Git') { 
            steps { 
                script { 
                    git branch: 'main', changelog: false, poll: false, url: 'https://github.com/max-az-10/my-app.git' 
                } 
            } 
        }
             
        stage('Verify Docker') {
            steps {
                script {
                    // Verify that Docker is available and working
                    sh 'docker --version'
                    sh 'docker build -t my-app-repo .'
                }
            }
        }
        
        stage('Login to ECR') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'aws-cred', passwordVariable: 'AWS_SECRET_ACCESS_KEY', usernameVariable: 'AWS_ACCESS_KEY_ID')]) {
                    sh 'aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $AWS_DOCKER_REGISTRY'
                }
            }
        }
        
        stage('Push to ECR') { 
            steps { 
                withCredentials([usernamePassword(credentialsId: 'aws-cred', passwordVariable: 'AWS_SECRET_ACCESS_KEY', usernameVariable: 'AWS_ACCESS_KEY_ID')]) {
                    sh '''
                        docker tag my-app-repo:latest 381492139836.dkr.ecr.us-west-2.amazonaws.com/my-app-repo:latest
                        docker push 381492139836.dkr.ecr.us-west-2.amazonaws.com/my-app-repo:latest
                    '''
                } 
            } 
        }
    }
}
