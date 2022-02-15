# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      #version = "=2.46.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  subscription_id = "7326e34e-9292-4688-b4d8-4afdea88d7f6"
  tenant_id       = "ab28c523-2071-4c77-b4b3-e308f657e36d"
}


