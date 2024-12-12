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
            def scannerHome = tool 'SonarQube Scanner';
            withSonarQubeEnv() {
              sh "${scannerHome}/bin/sonar-scanner"
            }
        }
    }
}
