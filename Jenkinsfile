pipeline {
    
    agent any
    
    environment {
        SONAR_SCANNER_HOME = tool 'SonarQube Scanner'
        //IMAGE_TAG = 'latest'
        //AWS_ECR_REPO = 'my-app-repo'
        //AWS_ECR_REGISTRY = '381492139836.dkr.ecr.us-west-2.amazonaws.com'
        //ECS_CLUSTER = ''
        //ECS_SERVICE = ''
        //REMOTE_HOST = '35.165.3.57'
        //REMOTE_USER = 'ubuntu'
        //TRIVY_IMAGE = 'your-docker-image'
    }
    
    stages {        
        stage('Checkout Git') {
            steps {
                git branch: 'main', changelog: false, credentialsId: 'Git-Token', poll: false, url: 'https://github.com/max-az-10/my-app.git'
            }
        }        
        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('SonarQube') {
                    sh "${SONAR_SCANNER_HOME}/bin/sonar-scanner"
                }
            }
        }
        stage('Docker image') {
            steps {
                script {
                    sh '''
                        docker build -t my-app-repo .
                        docker tag my-app-repo:latest 381492139836.dkr.ecr.us-west-2.amazonaws.com/my-app-repo:latest
                    '''
                }
            }
        }
       
    }
}
