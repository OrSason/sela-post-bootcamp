
resource "azurerm_resource_group" "rg" {
  name     = var.resourceGroupName
  location = var.location
}

module "aks"{
source                = "../tf-modules/aks"
resourceGroupName     = var.resourceGroupName
location              = var.location
env_name              = var.env_name
aks_name              = "${var.env_name}-AKS"
node_size             = var.node_size
node_pool_name        = "${var.env_name}np"
depends_on            = [azurerm_resource_group.rg]
ssh_key               = var.ssh_key
serviceprinciple_id   = var.serviceprinciple_id
serviceprinciple_key  = var.serviceprinciple_key

}

module "ingress_nginx" {
  source                = "../tf-modules/ingress-nginx"
  env_np                = var.env_name
}

