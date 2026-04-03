pipeline {
    agent any

    parameters {
        choice(name: 'ACTION', choices: ['apply', 'destroy'], description: 'Choose Action')
        string(name: 'INSTANCE_TYPE', defaultValue: 't3.micro', description: 'EC2 Instance Type')
    }

    environment {
        AWS_DEFAULT_REGION = 'ap-south-1'
        AWS_CREDENTIALS = credentials('aws-creds')
        // Use your GitHub credentials ID here to allow pushing state back
        GIT_AUTH = credentials('github-creds') 
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Wipe the workspace to ensure we start clean with the latest state from Git
                cleanWs()
                git branch: 'main', credentialsId: 'github-creds', url: 'https://github.com/Bishal-hub/terraform-project.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Action') {
            steps {
                script {
                    if (params.ACTION == 'apply') {
                        sh "terraform apply -auto-approve -var='instance_type=${params.INSTANCE_TYPE}'"
                        sh "terraform output"
                    } else {
                        sh "terraform destroy -auto-approve -var='instance_type=${params.INSTANCE_TYPE}'"
                    }
                }
            }
        }

        stage('Push State to Git') {
            steps {
                script {
                    // This stage saves your local state back to GitHub so "Destroy" works later
                    sh """
                        git config user.email "jenkins@example.com"
                        git config user.name "Jenkins CI"
                        git add terraform.tfstate
                        git commit -m "Update terraform state after ${params.ACTION} [skip ci]" || echo "No changes to state"
                        git push https://${GIT_AUTH_USR}:${GIT_AUTH_PSW}@github.com/Bishal-hub/terraform-project.git main
                    """
                }
            }
        }
    }
}