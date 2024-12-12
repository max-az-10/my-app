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
                withCredentials([string(credentialsId: 'Sonar-Token', variable: 'Sonar-T')]) {
                    withSonarQubeEnv('SonarQube') {
                        sh """
                            sonar-scanner \
                                -Dsonar.projectKey=Onix-Website \
                                -Dsonar.sources=. \
                                -Dsonar.host.url=http://35.165.3.57:9000 \
                                -Dsonar.scanner.timeout=600 \
                                -Dsonar.login=\$Sonar-T
                        """
                    }
                }         
            }
        }
    }
}
