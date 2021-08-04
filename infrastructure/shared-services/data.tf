
data "azurerm_kubernetes_cluster" "cluster" {
  name                = "${var.env_name}-AKS"
  resource_group_name = var.resourceGroupName
  depends_on = [ 
      module.aks
      ]
}


data "kubernetes_ingress" "ingress" {
metadata {
    name = "ingress"
  }
  depends_on = [ 
      module.ingress_nginx
      ]
}


