pipeline {
    agent {
        docker {
            image 'hashicorp/terraform:latest' // Use the Terraform image from Docker Hub
            args '-u root' // Run as root user (optional, depending on your requirements)
        }
    }

    environment {
        TF_VAR_subscription_id = credentials('azure_subscription_id')
        TF_VAR_client_id = credentials('azure_client_id')
        TF_VAR_client_secret = credentials('azure_client_secret')
        TF_VAR_tenant_id = credentials('azure_tenant_id')
    }

    stages {
        stage("Checkout") {
            steps {
                echo "========executing Checkout========"
                git branch: 'main', url: 'https://github.com/dipmndl/infra-terraforrm-azure.git'
            }
            post {
                success {
                    echo "========Checkout executed successfully========"
                }
                failure {
                    echo "========Checkout execution failed========"
                }
            }
        }

        stage("Terraform Init") {
            steps {
                echo "========executing Terraform Init========"
                sh 'terraform init'
            }
            post {
                success {
                    echo "========Terraform Init executed successfully========"
                }
                failure {
                    echo "========Terraform Init execution failed========"
                }
            }
        }

        stage("Terraform Plan") {
            steps {
                echo "========executing Terraform Plan========"
                sh 'terraform plan -out=tfplan'
            }
            post {
                success {
                    echo "========Terraform Plan executed successfully========"
                }
                failure {
                    echo "========Terraform Plan execution failed========"
                }
            }
        }

        stage("Terraform Apply") {
            steps {
                echo "========executing Terraform Apply========"
                sh 'terraform apply -input=false tfplan'
            }
            post {
                success {
                    echo "========Terraform Apply executed successfully========"
                }
                failure {
                    echo "========Terraform Apply execution failed========"
                }
            }
        }
    }

    post {
        always {
            echo "========always========"
            cleanWs()
        }
        success {
            echo "========pipeline executed successfully ========"
        }
        failure {
            echo "========pipeline execution failed========"
        }
    }
}
