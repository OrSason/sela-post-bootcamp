
resource "azurerm_resource_group" "rg" {
  name     = var.resourceGroupName
  location = var.location
}





module "dev_aks"{
source            = "../tf-modules/aks"
resourceGroupName = var.resourceGroupName
location          = var.location
aks_name          = "devAKS"
node_size         = "Standard_D2_v2"
node_pool_name    = "devnp"
depends_on          = [azurerm_resource_group.rg]

}


