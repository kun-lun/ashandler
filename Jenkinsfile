pipeline {
    agent { docker { image 'golang:1.10.3' } }
    stages {
        stage('basic test') {
            steps {
                sh "${env.WORKSPACE}/scripts/basic_check.sh"
            }
        }
    }
}