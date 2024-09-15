pipeline {
    agent {
        docker {
            image 'ubuntu-image'  // Use the local Docker image
            label 'docker'        // Ensure it's using a node with Docker installed
            reuseNode true        // Reuse the container, don't create a new one
        }
    }

    environment {
        TF_VAR_subscription_id = credentials('azure_subscription_id')
        TF_VAR_client_id = credentials('azure_client_id')
        TF_VAR_client_secret = credentials('azure_client_secret')
        TF_VAR_tenant_id = credentials('azure_tenant_id')
        SONAR_AUTH_TOKEN = credentials('sonarqube-jenkins-tokens')
    }

    stages {
        stage("Checkout") {
            steps {
                echo "========executing Checkout========"
                git branch: 'main', url: 'https://github.com/dipmndl/infra-terraforrm-azure.git'
            }
        }

        stage("SonarQube analysis") {
            steps {
                echo "========executing SonarQube analysis========"
                script {
                    def scannerHome = tool name: 'SonarQube-Docker', type: 'hudson.plugins.sonar.SonarRunnerInstallation'
                    withSonarQubeEnv('Your SonarQube Server') {
                        sh """
                           ${scannerHome}/bin/sonar-scanner \
                           -Dsonar.projectKey=dipmndl_infra_terraform_azur \
                           -Dsonar.sources=. \
                           -Dsonar.host.url=http://127.0.1.1:9000 \
                           -Dsonar.login=${env.SONAR_AUTH_TOKEN}
                        """
                    }
                }
            }
        }

        stage("Terraform Init") {
            steps {
                echo "========executing Terraform Init========"
                sh 'terraform init'
            }
        }

        stage("Terraform Plan") {
            steps {
                echo "========executing Terraform Plan========"
                sh 'terraform plan -out=tfplan'
            }
        }

        stage("Terraform Destroy") {
            steps {
                echo "========executing Terraform Destroy========"
                sh 'terraform destroy -auto-approve'
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
