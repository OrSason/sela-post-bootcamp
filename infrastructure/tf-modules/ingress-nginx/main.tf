provider "kubernetes" {
    #load_config_file       = "false"
    host                   =  var.host
    client_certificate     =  var.client_certificate
    client_key             =  var.client_key
    cluster_ca_certificate =  var.cluster_ca_certificate
}

provider "helm" {
    kubernetes {
        
        host                   = var.host
        client_key             = var.client_key
        client_certificate     = var.client_certificate
        cluster_ca_certificate = var.cluster_ca_certificate
    }  
}

resource "kubernetes_namespace" "workspace_np" {
  metadata {
    name = var.env_np
  }
}


resource "helm_release" "nginx_ingress" {
  name = "nginx-ingress-controller"
  namespace = var.env_np
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "nginx-ingress-controller"
  values = [
    file("/values.yaml")
  ]
  set {
    name  = "service.type"
    value = "LoadBalancer"
  }
  
}
