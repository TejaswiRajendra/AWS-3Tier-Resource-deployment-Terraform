pipeline {
    agent any
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
            steps {
                sh 'terraform apply -auto-approve tfplan'  // No -var here
            }
        }
    }
}
