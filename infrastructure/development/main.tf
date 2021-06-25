
resource "azurerm_resource_group" "rg" {
  name     = var.resourceGroupName
  location = var.location
}

module "dev_aks"{
source                = "../tf-modules/aks"
resourceGroupName     = var.resourceGroupName
location              = var.location
aks_name              = "devAKS"
node_size             = var.node_size
node_pool_name        = "devnp"
depends_on            = [azurerm_resource_group.rg]
ssh_key               = var.ssh_key
serviceprinciple_id   = var.serviceprinciple_id
serviceprinciple_key  = var.serviceprinciple_key

}

module "ingress-nginx" {
  source                = "../tf-modules/ingress-nginx"
  host                  = module.dev_aks.host
  client_certificate    = base64decode(module.dev_aks.client_certificate)
  client_key            = base64decode(module.dev_aks.client_key)
  cluster_ca_certificate= base64decode(module.dev_aks.cluster_ca_certificate)
  env_np                = "dev"
}

