terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

resource "azurerm_kubernetes_cluster" "AKS" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.resourceGroupName
  dns_prefix          = "dns-pre"

  default_node_pool {
    name       = var.node_pool_name
    node_count = 1
    vm_size    = var.node_size
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}