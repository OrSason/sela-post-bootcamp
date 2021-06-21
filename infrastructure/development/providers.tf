
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

provider "azurerm" {
  
 subscription_id = var.subscription_id
 client_id       = var.serviceprinciple_id
 client_secret   = var.serviceprinciple_key
 tenant_id       = var.tenant_id


  features {}
}
