pipeline {
    agent any

    parameters {
        choice(name: 'ACTION', choices: ['apply', 'destroy'], description: 'Choose whether to create or delete the infrastructure')
        string(name: 'INSTANCE_TYPE', defaultValue: 't3.micro', description: 'EC2 Instance Type')
    }

    environment {
        AWS_DEFAULT_REGION = 'ap-south-1'
        // This makes credentials available to all stages automatically
        AWS_CREDENTIALS = credentials('aws-creds')
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Bishal-hub/terraform-project.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        // --- APPLY LOGIC ---
        stage('Terraform Plan (Apply)') {
            when { expression { params.ACTION == 'apply' } }
            steps {
                sh "terraform plan -var='instance_type=${params.INSTANCE_TYPE}'"
            }
        }

        stage('Terraform Apply') {
            when { expression { params.ACTION == 'apply' } }
            steps {
                sh "terraform apply -auto-approve -var='instance_type=${params.INSTANCE_TYPE}'"
            }
        }

        // --- DESTROY LOGIC ---
        stage('Terraform Plan (Destroy)') {
            when { expression { params.ACTION == 'destroy' } }
            steps {
                sh "terraform plan -destroy -var='instance_type=${params.INSTANCE_TYPE}'"
            }
        }

        stage('Terraform Destroy') {
            when { expression { params.ACTION == 'destroy' } }
            steps {
                sh "terraform destroy -auto-approve -var='instance_type=${params.INSTANCE_TYPE}'"
            }
        }

        // --- FINAL STATUS ---
        stage('Show Outputs') {
            when { expression { params.ACTION == 'apply' } }
            steps {
                sh 'terraform output'
            }
        }
    }
}