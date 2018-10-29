pipeline {
    agent { docker { image 'golang:1.10.3' } }
    stages {
        stage('install dependencies') {
            steps {
                sh 'go get -u golang.org/x/lint/golint'
                sh 'go get -u github.com/onsi/ginkgo/ginkgo'
                sh 'go get -u github.com/onsi/gomega/...'
            }
        }
        stage('golint') {
            steps {
                sh 'golint `go list ./... | grep -v /vendor/`'
            }
        }
        stage('unit test') {
            steps {
                sh 'ginkgo -r'
            }
        }
    }
}