pipeline {
    agent any
    environment {
        AWS_REGION = 'ap-south-1'
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'US-4321', url: 'https://github.com/TejaswiRajendra/AWS-3Tier-Terraform.git'
            }
        }
        stage('Init Terraform') {
            steps {
                withCredentials([
                    string(credentialsId: 'aws-access-key-id', variable: 'AWS_ACCESS_KEY_ID'),
                    string(credentialsId: 'aws-secret-access-key', variable: 'AWS_SECRET_ACCESS_KEY')
                ]) {
                    sh 'terraform init'
                }
            }
        }
        stage('Plan Terraform') {
            steps {
                withCredentials([
                    string(credentialsId: 'aws-access-key-id', variable: 'AWS_ACCESS_KEY_ID'),
                    string(credentialsId: 'aws-secret-access-key', variable: 'AWS_SECRET_ACCESS_KEY')
                ]) {
                    sh "terraform plan -out=tfplan -var 'aws_region=${AWS_REGION}'"
                }
            }
        }
        stage('Apply Terraform') {
            steps {
                withCredentials([
                    string(credentialsId: 'aws-access-key-id', variable: 'AWS_ACCESS_KEY_ID'),
                    string(credentialsId: 'aws-secret-access-key', variable: 'AWS_SECRET_ACCESS_KEY')
                ]) {
                    sh "terraform apply -auto-approve tfplan -var 'aws_region=${AWS_REGION}'"
                }
            }
        }
    }
}