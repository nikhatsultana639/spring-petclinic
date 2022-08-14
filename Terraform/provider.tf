variable "client_secret" {
}

# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  subscription_id = "b5913168-40de-4d42-8e24-716030312cd1"
  client_id       = "bc9b33ae-9824-4ce8-80b1-f19a43a98b7c"
  client_secret   = var.client_secret
  tenant_id       = "359d658c-cdc8-4097-804d-c58d9588de63"
}
