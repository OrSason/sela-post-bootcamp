
resource "azurerm_resource_group" "rg" {
  name     = var.resourceGroupName
  location = var.location
}

resource "azurerm_container_registry" "acr" {
  name                     = var.registry_name
  resource_group_name      = var.resourceGroupName
  location                 = var.location
  sku                      = "Standard"
  admin_enabled            = false
  #georeplication_locations = ["North Europe"]
  depends_on          = [azurerm_resource_group.rg]
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
  host                  = module.aks.host
  client_certificate    = base64decode(module.aks.client_certificate)
  client_key            = base64decode(module.aks.client_key)
  cluster_ca_certificate= base64decode(module.aks.cluster_ca_certificate)
  env_np                = var.env_name
}