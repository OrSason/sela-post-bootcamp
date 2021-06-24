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
    "${file("values.yaml")}"
  ]
  set {
    name  = "service.type"
    value = "LoadBalancer"
  }
  
}
/*
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
    namespace = var.env_np
    labels = {
      app = "app1"
    }
    annotations = {
      "kubernetes.io/ingress.class" = "nginx"
    }
  }
  spec {

    rule {
      host = "foo.com"
      http {
        path {
          backend {
            service_name = "svc"
            service_port = "http"
          }
        }
      }
    }

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

    rule {
      http {
        path {
          path = "/app1/*"
          backend {
            service_name = "app1"
            service_port = 8080
          }
        }
      }
    }
  }
}


resource "kubernetes_pod" "example" {
  metadata {
    name = "terraform-example"
    namespace = var.env_np
    labels = {
      app = "app1"
    }
  }

  spec {
    container {
      image = "nginx:1.7.9"
      name  = "example"

      port {
        container_port = 8080
      }
    }
  }
}

output "load_balancer_ip" {
  value = kubernetes_ingress.example.status.0.load_balancer.0.ingress.0.ip
}
*/