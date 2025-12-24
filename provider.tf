terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
  required_version = ">= 0.14.0"

  backend "azurerm" {
    resource_group_name  = "1-2701b53e-playground-sandbox"
    storage_account_name = "bestrongstorageacct"
    container_name       = "tfstate"
    key                  = "bestrong.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "80ea84e8-afce-4851-928a-9e2219724c69"
  tenant_id       = "84f1e4ea-8554-43e1-8709-f0b8589ea118"
  resource_provider_registrations = "none"
}
