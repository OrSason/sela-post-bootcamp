

resource "helm_release" "jenkins" {
  name       = "jenkins"
  namespace  = var.env_np
  repository = "https://charts.jenkins.io"
  chart      = "jenkins"
   values = [
   file("/helm-values/jenkins.yaml")
  ]

  set {
    name  = "fullnameOverride"
    value = "jenkins"
  }

  set {
    name  = "controller.adminUser"
    value = var.jenkins_user
  }

  set_sensitive {
    name  = "controller.adminPassword"
    value = var.jenkins_pass
  }

  //provide extra variables
  /*

   set {
    name  = "backup.env[0].value"
    value = var.azure_storage_account
  }

  set_sensitive {
    name  = "backup.env[1].value"
    value = var.azure_storage_key
  }

 */
}





## Expose jenkins server

resource "kubernetes_ingress" "ingress" {
  wait_for_load_balancer = true
  metadata {
    name = "ingress"
    namespace = var.env_np
    annotations = {
      "kubernetes.io/ingress.class" = "nginx"
     # "nginx.ingress.kubernetes.io/rewrite-target" = "/"
    }
  }
  spec {
    rule {
      http {
        path {
          path = "/jenkins"
          backend {
            service_name = "jenkins"
            service_port = 8080
          }
        }
      }
    }
  }
  }


 resource "kubernetes_secret" "jenkinsazure" {
  metadata {
    name = "jenkinsazure"
    namespace = var.env_np
  }

  data = {
    azure_storage_account = var.azure_storage_account
    azure_storage_key = var.azure_storage_key
  }
} 

  
