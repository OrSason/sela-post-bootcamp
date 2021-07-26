
resource "azurerm_resource_group" "rg" {
  name     = var.resourceGroupName
  location = var.location

}

resource "azurerm_container_registry" "acr" {
  name                     = var.registry_name
  resource_group_name      = var.resourceGroupName
  location                 = var.location
  sku                      = "Standard"
  admin_enabled            = true
  depends_on               = [azurerm_resource_group.rg]
}


module "aks"{
source                = "../tf-modules/aks"
resourceGroupName     = var.resourceGroupName
location              = var.location
env_name              = var.env_name
node_size             = var.node_size
#access to nodes
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


module "jenkins" {
  source                = "../tf-modules/jenkins"
  env_np                = var.env_name
  jenkins_user          = var.jenkins_user
  jenkins_pass          = var.jenkins_pass
  azure_storage_account = var.azure_storage_account
  azure_storage_key     = var.azure_storage_key

}
