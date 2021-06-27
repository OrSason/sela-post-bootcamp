
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
    container_name        = "tfstate-dev"
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

provider "kubernetes" {
    host                  = data.azurerm_kubernetes_cluster.cluster.kube_config.0.host
    client_certificate    = base64decode(data.azurerm_kubernetes_cluster.cluster.kube_config.0.client_certificate)
    client_key            = base64decode(data.azurerm_kubernetes_cluster.cluster.kube_config.0.client_key)
    cluster_ca_certificate= base64decode(data.azurerm_kubernetes_cluster.cluster.kube_config.0.cluster_ca_certificate)
}

provider "helm" {
    kubernetes {

    host                  = data.azurerm_kubernetes_cluster.cluster.kube_config.0.host
    client_certificate    = base64decode(data.azurerm_kubernetes_cluster.cluster.kube_config.0.client_certificate)
    client_key            = base64decode(data.azurerm_kubernetes_cluster.cluster.kube_config.0.client_key)
    cluster_ca_certificate= base64decode(data.azurerm_kubernetes_cluster.cluster.kube_config.0.cluster_ca_certificate)

    }  
}
