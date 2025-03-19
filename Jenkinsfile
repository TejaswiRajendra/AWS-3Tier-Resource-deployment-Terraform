pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    }
    stages {
        stage('Init Terraform') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Plan Terraform') {
            steps {
                sh 'terraform plan -out=tfplan -var="aws_region=us-east-1"'
            }
        }
        stage('Apply Terraform') {
            when {
                branch 'master'  // Runs only on the master branch
            }
            steps {
                sh 'terraform apply -auto-approve tfplan'
            }
        }
    }
}
