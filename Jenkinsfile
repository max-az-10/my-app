pipeline {
    agent any
    
    stages {
        stage('checkout git') {
            steps {
                git branch: 'main', changelog: false, credentialsId: 'Git-Token', poll: false, url: 'https://github.com/max-az-10/my-app.git'
            }
        }
    }
    
}
