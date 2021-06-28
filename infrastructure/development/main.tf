
resource "azurerm_resource_group" "rg" {
  name     = var.resourceGroupName
  location = var.location
}

module "aks"{
source                = "../tf-modules/aks"
resourceGroupName     = var.resourceGroupName
location              = var.location
env_name              = var.env_name
node_size             = var.node_size

# Access to the nodes
admin_username        = var.admin_username
ssh_key               = var.ssh_key

# Service principal used for giving the cluster access to the subscription 
serviceprinciple_id   = var.serviceprinciple_id
serviceprinciple_key  = var.serviceprinciple_key
depends_on            = [azurerm_resource_group.rg]

}

module "ingress_nginx" {
  source                = "../tf-modules/ingress-nginx"
  env_np                = var.env_name
}

