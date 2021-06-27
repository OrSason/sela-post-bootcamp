
/*
output "kube_config" {
    value = data.azurerm_kubernetes_cluster.cluster.kube_config_raw
}

output "cluster_ca_certificate" {
    value = data.azurerm_kubernetes_cluster.cluster.kube_config.0.cluster_ca_certificate
}

output "client_certificate" {
    value = data.azurerm_kubernetes_cluster.cluster.kube_config.0.client_certificate
}

output "client_key" {
    value = data.azurerm_kubernetes_cluster.cluster.kube_config.0.client_key
}

output "host" {
    value = data.azurerm_kubernetes_cluster.cluster.kube_config.0.host
}
*/