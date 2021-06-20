
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


resource "kubernetes_service" "example" {
  metadata {
    name = "ingress-service"
  }
  spec {
    port {
      port = 80
      target_port = 80
      protocol = "TCP"
    }
    type = "NodePort"
  }
}

resource "kubernetes_ingress" "example" {
  wait_for_load_balancer = true
  metadata {
    name = "example"
    annotations = {
      "kubernetes.io/ingress.class" = "nginx"
    }
  }
  spec {
    rule {
      http {
        path {
          path = "/*"
          backend {
            service_name = kubernetes_service.example.metadata.0.name
            service_port = 80
          }
        }
      }
    }
  }
}

