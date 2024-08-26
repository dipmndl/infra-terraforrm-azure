
# Use the latest Ubuntu 22.04 image as the base
FROM ubuntu:22.04

# Set environment variables to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install necessary dependencies

RUN apt-get update --fix-missing && \
    apt-get install -y --no-install-recommends \
    wget \
    curl \
    unzip \
    gnupg \
    software-properties-common || \
    apt-get install -y --no-install-recommends \
    wget \
    curl \
    unzip \
    gnupg \
    software-properties-common

# Install JDK 21
RUN add-apt-repository ppa:openjdk-r/ppa && \
    apt-get update && \
    apt-get install -y openjdk-21-jdk

# Download and install the latest version of Terraform
RUN wget https://releases.hashicorp.com/terraform/1.9.5/terraform_1.9.5_linux_amd64.zip && \
    unzip terraform_1.9.5_linux_amd64.zip && \
    mv terraform /usr/local/bin/ && \
    rm terraform_1.9.5_linux_amd64.zip

# Print the versions of JDK and Terraform
RUN java -version && \
    terraform -version

# Set the default command to bash
CMD ["/bin/bash"]

