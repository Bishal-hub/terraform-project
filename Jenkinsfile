pipeline {

    agent any
 
    parameters {

        choice(name: 'ACTION', choices: ['apply', 'destroy'], description: 'Terraform Action')

        string(name: 'INSTANCE_TYPE', defaultValue: 't3.micro', description: 'EC2 Instance Type')

    }
 
    environment {

        AWS_DEFAULT_REGION = 'ap-south-1'

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
 
        stage('Terraform Plan') {

            steps {

                sh "terraform plan -var='instance_type=${params.INSTANCE_TYPE}'"

            }

        }
 
        stage('Terraform Apply') {
            environment {
            AWS_CREDENTIALS = credentials('aws-creds')
            }
            steps {
            sh 'terraform apply -auto-approve -var=instance_type=t3.micro'
            }
        }
 
        stage('Terraform Destroy') {
            environment {
            AWS_CREDENTIALS = credentials('aws-creds')
            }
            steps {
            sh 'terraform destroy -auto-approve -var=instance_type=t3.micro'
            }
        }
 
        stage('Show Outputs') {

            steps {

                sh 'terraform output'

            }

        }

    }

}
