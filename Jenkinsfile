pipeline { 
    agent any 
    environment {
        //APP_NAME = 'my-app'
        AWS_REGION = 'us-west-2' 
        AWS_DOCKER_REGISTRY = '381492139836.dkr.ecr.us-west-2.amazonaws.com' 
        //ECS_CLUSTER = 'your-ecs-cluster-name' 
        //ECS_SERVICE = 'your-ecs-service-name' 
    } 

    stages {
      
        stage('Checkout Git') { 
            steps { 
                script { 
                    git branch: 'main', changelog: false, poll: false, url: 'https://github.com/max-az-10/my-app.git' 
                } 
            } 
        }
             
        stage('Build Docker Image') {
          agent {
            docker {
              image 'nginx:1.27-alpine'
                args "-u root -v /var/run/docker.sock:/var/run/docker.sock --entrypoint=''"
            }
          }           
          steps {
            script {
              withCredentials([usernamePassword(credentialsId: 'aws-cred', passwordVariable: 'AWS_SECRET_ACCESS_KEY', usernameVariable: 'AWS_ACCESS_KEY_ID')]) {
                sh 'docker --version'   
              }  
            }
          }
        }
    }
}
