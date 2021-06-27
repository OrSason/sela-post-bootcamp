
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
    file("helm-values/nginx-ingress.yaml")
  ]
  set {
    name  = "service.type"
    value = "LoadBalancer"
  }
  
}


