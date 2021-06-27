data "azurerm_kubernetes_cluster" "cluster" {
  name                = "${var.env_name}-AKS"
  resource_group_name = var.resourceGroupName
  depends_on = [ 
      module.aks
      ]
}