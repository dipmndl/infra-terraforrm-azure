# We first specify the terraform provider. 
# Terraform will use the provider to ensure that we can work with Microsoft Azure

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.114.0"
    }
  }
}

provider "azurerm" {
    subscription_id = "5c8e7ff8-f11a-494d-b9f6-bdf94644d9f2"
    client_id = "68c91b8d-4aa9-4658-a256-2c24cebe8fb7"
    client_secret = "3bfe90b2-56cd-469a-841e-d932f4ea4d22"
    tenant_id = "ff332086-8701-4ba8-82e7-808c3f13eea6"
    features {
      
    }
}
 
# The resource block defines the type of resource we want to work with
# The name and location are arguements for the resource block

resource "azurerm_resource_group" "sg_genai" {
  name     = "sg-genai"
  location = "Central India"
  tags = {
    key   = "genai"
    value = "dev"
  }
}