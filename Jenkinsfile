pipeline {
    agent any
    environment {
        SONAR_PROJECT_KEY = 'Onix-Website'
        SONAR_SCANNER_HOME = tool 'SonarQube Scanner'
    }
    stages {
        stage('Checkout Git') {
            steps {
                git branch: 'main', changelog: false, credentialsId: 'Git-Token', poll: false, url: 'https://github.com/max-az-10/my-app.git'
            }
        }
        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv() {
                    sh "${SONAR_SCANNER_HOME}/bin/sonar-scanner"
                }
            }
        }
    }
}
