pipeline {
    
    agent any
    
    environment {
        SONAR_SCANNER_HOME = tool 'SonarQube Scanner'
        IMAGE_TAG = 'latest'
        ECR_REPO = 'my-app-repo'
        ECR_REGISTRY = '381492139836.dkr.ecr.us-west-2.amazonaws.com'
        //ECS_CLUSTER = ''
        //ECS_SERVICE = ''
        REMOTE_HOST = '35.165.3.57'
        REMOTE_USER = 'ubuntu'
        TRIVY_IMAGE = "${ECR_REGISTRY}/${ECR_REPO}:${IMAGE_TAG}"
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
                        docker build -t ${ECR_REPO}:${IMAGE_TAG} .
                        docker tag ${ECR_REPO}:${IMAGE_TAG} ${ECR_REGISTRY}/${ECR_REPO}:${IMAGE_TAG}
                    '''
                }
            }
        }
        stage('Trivy Scan on Remote Server') {
            steps {
                    script {
                        sh """
                            # Run Trivy to scan the Docker image and save the report
                            trivy image --severity HIGH,MEDIUM --format table -o trivy-report.html ${TRIVY_IMAGE}
                        """
                    }
            }
        }
    }
}
