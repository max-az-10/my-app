pipeline {
    agent any
    environment {
        SONAR_PROJECT_KEY = 'Onix-Website'
        SONAR_SCANNER_HOME = tool 'SonarQube Scanner'
    }   
    stages {
        stage('checkout git') {
            steps {
                git branch: 'main', changelog: false, credentialsId: 'Git-Token', poll: false, url: 'https://github.com/max-az-10/my-app.git'
            }
        }
        stage('SonarQube Analysis') {
            steps {
                withCredentials([string(credentialsId: 'SONAR_TOKEN', variable: 'SONAR_TOKEN')]) {
                    withSonarQubeEnv('SonarQube') {
                        sh """
                            ${SONAR_SCANNER_HOME}/bin/sonar-scanner \
                            -Dsonar.projectKey=Onix-Website \
                            -Dsonar.sources=. \
                            -Dsonar.host.url=http://172.30.56.3:9000 \
                            -Dsonar.scanner.timeout=600 \
                            -Dsonar.login=\$SONAR_TOKEN
                        """
                    }
                }         
            }
        }
    }  
}
