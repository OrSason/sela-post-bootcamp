
resource "azurerm_resource_group" "rg" {
  name     = var.resourceGroupName
  location = var.location
}


module "prod_aks"{
source            = "../tf-modules/aks"
resourceGroupName = var.resourceGroupName
location          = var.location
aks_name          = "prodAKS"
node_size         = "Standard_D2_v2"
node_pool_name    = "prodnp"
depends_on          = [azurerm_resource_group.rg]

}