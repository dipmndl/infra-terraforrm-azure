## Terraform Azure Configuration
This README provides step-by-step instructions on setting up and managing Azure resources using Terraform and the Azure CLI.
![image](https://github.com/user-attachments/assets/5177c19a-c471-4e9c-97a8-50cd6bacf829)

## Prerequisites
- Azure CLI installed and configured.
- Terraform installed.
- An Azure account with appropriate permissions.

## Environment Setup

# Step 1: Install Azure CLI
- Windows
    - Download and install the Azure CLI MSI installer from the official Azure CLI installation page.
    - After installation, open a new Command Prompt or PowerShell session and verify the installation by running:
        ```
        $  az --version
        ```
- macOS
    - Install the Azure CLI using Homebrew:
        ```
        $ brew update && brew install azure-cli
         ```
- Linux
    - Install the Azure CLI using the package manager for your specific distribution. For example, on Ubuntu:
        ```
        $ curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
         ```
# Step 2: Configure Azure CLI in Git Bash (Windows Users)
- Ensure the Azure CLI is in your PATH. Typically, the Azure CLI is installed in C:\Program Files (x86)\Microsoft SDKs\Azure\CLI2\wbin.
- Open Git Bash and edit your .bashrc file to include the Azure CLI path:
    ```
    $ nano ~/.bashrc
    ```
- Add the following line to the end of the file:
    ```
    $ export PATH=$PATH:/c/Program\ Files/Microsoft\ SDKs/Azure\CLI2\wbin
    ```
- Save the file and exit the editor. In nano, you can save and exit by pressing CTRL+O to write the file and CTRL+X to exit.
- Source the .bashrc file to apply the changes immediately:
    ```
    $ source ~/.bashrc
    ```
# Step 3: Authenticate with Azure
- Open your terminal (Git Bash recommended for Windows users) and log in to your Azure account:
    ```
    $ az login
    ```
- Follow the prompts to sign in with your Azure account credentials.
# Step 4: Set Up Environment Variables
- Create a file named `.env` (or any preferred name) with the following content:

    `ARM_SUBSCRIPTION_ID`="your_subscription_id"
    `ARM_CLIENT_ID`="your_client_id"
    `ARM_CLIENT_SECRET`="your_client_secret"
    `ARM_TENANT_ID`="your_tenant_id"
- Export these variables in your shell session. For Git Bash on Windows, add the following lines to your `~/.bashrc` or `~/.bash_profile` file:
    `export ARM_SUBSCRIPTION_ID`="your_subscription_id"
    `export ARM_CLIENT_ID`="your_client_id"
    `export ARM_CLIENT_SECRET`="your_client_secret"
    `export ARM_TENANT_ID`="your_tenant_id"
- Source the .bashrc file to apply the changes:`
    `source`  ~/.bashrc

## Terraform Commands

# Auto correct format and style
    ```
    $ terraform fmt
    ```

# Validate
- Validate configuration files:
    ```
    $ terraform validate
    ```

# Initialize Terraform
- Navigate to the directory containing your Terraform configuration files (`provider.tf`, etc.) and initialize specified configuration:
    ```
    $ terraform init
    ```
# Plan the Terraform Changes
- Generate and show an execution plan that what are the changes are goining to create/modify/delete:
    ```
    $ terraform plan
    ```
# Apply the Terraform Changes
- Apply the changes required to reach the desired state of the configuration post approval(Yes/No):
    ```
    $ terraform apply
    ```
- With variables file
    ```
    $ terraform apply -var-file="terraform.tfvars"
    ```
# Destroy the Terraform-managed Infrastructure
- Destroy the Terraform-managed infrastructure post approval(Yes/No):
     ```
    $ terraform destroy
     ```
# Optional: Automatically approve the destruction without interactive confirmation:
    ```
    $ terraform destroy -auto-approve
    ```
