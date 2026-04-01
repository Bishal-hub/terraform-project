pipeline {
    agent any

    stages {
        stage('Terraform Init') {
            steps {
                bat 'C:\\terraform\\terraform.exe init'
            }
        }

        stage('Terraform Plan') {
            steps {
                bat 'C:\\terraform\\terraform.exe plan'
            }
        }

        stage('Terraform Apply') {
            steps {
                bat 'C:\\terraform\\terraform.exe apply -auto-approve'
            }
        }
    }
}
