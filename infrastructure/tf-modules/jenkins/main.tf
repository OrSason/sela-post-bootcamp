
resource "helm_release" "jenkins" {
  name       = "jenkins"
  namespace  = var.env_np
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "jenkins"
   values = [
   file("/helm-values/jenkins.yaml")
  ]

  set {
    name  = "fullnameOverride"
    value = "jenkins"
  }

  set {
    name  = "jenkinsUser"
    value = var.jenkins_user
  }

  set {
    name  = "jenkinsPassword"
    value = var.jenkins_pass
  }

  set {
    name  = "service.type"
    value = "NodePort"
  }

  set {
    name  = "service.port"
    value = "80"
  }

}

resource "kubernetes_ingress" "ingress" {
  wait_for_load_balancer = true
  metadata {
    name = "ingress"
    namespace = var.env_np
    annotations = {
      "kubernetes.io/ingress.class" = "nginx"
      "nginx.ingress.kubernetes.io/rewrite-target" = "/"
    }
  }
  spec {
    rule {
      http {
        path {
          path = "/"
          backend {
            service_name = "jenkins"
            service_port = 80
          }
        }
      }
    }
  }
  }
  