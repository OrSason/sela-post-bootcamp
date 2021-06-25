
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }

  backend "azurerm" {
    resource_group_name   = "storage-rg"
    storage_account_name  = "aksterra"
    container_name        = "tfstate-prod"
    key                   = "terraform.tfstate"
  }
}

provider "azurerm" {
  
 subscription_id = var.subscription_id
 client_id       = var.serviceprinciple_id
 client_secret   = var.serviceprinciple_key
 tenant_id       = var.tenant_id


  features {}
}


