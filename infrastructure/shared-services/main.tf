
resource "azurerm_resource_group" "rg" {
  name     = var.resourceGroupName
  location = var.location
}

resource "azurerm_container_registry" "acr" {
  name                     = "ors09"
  resource_group_name      = var.resourceGroupName
  location                 = var.location
  sku                      = "Standard"
  admin_enabled            = false
  #georeplication_locations = ["North Europe"]
  depends_on          = [azurerm_resource_group.rg]
}

module "shared_aks"{
source            = "../tf-modules/aks"
resourceGroupName = var.resourceGroupName
location          = var.location
aks_name          = "sharedAKS"
node_size         = "Standard_D2_v2"
node_pool_name    = "sharednp"
depends_on          = [azurerm_resource_group.rg]

}
