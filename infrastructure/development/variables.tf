
variable "resourceGroupName"{
   type = string
   description = "Name of resource group"
}

variable "location"{
   type = string
   description = "Name of resource group"
}


variable "subscription_id"{
}

variable "serviceprinciple_id"{
}
variable "serviceprinciple_key"{
}
variable "tenant_id"{
}

variable "ssh_key" {
    default = "~/.ssh/id_rsa2.pub"
}

/*

variable "agent_count" {
    default = 3
}

variable "ssh_public_key" {
    default = "~/.ssh/id_rsa.pub"
}

variable "dns_prefix" {
    default = "k8stest"
}

variable cluster_name {
    default = "k8stest"
}

variable resource_group_name {
    default = "azure-k8stest"
}

variable location {
    default = "Central US"
}

variable log_analytics_workspace_name {
    default = "testLogAnalyticsWorkspaceName"
}

# refer https://azure.microsoft.com/global-infrastructure/services/?products=monitor for log analytics available regions
variable log_analytics_workspace_location {
    default = "eastus"
}

# refer https://azure.microsoft.com/pricing/details/monitor/ for log analytics pricing 
variable log_analytics_workspace_sku {
    default = "PerGB2018"
}
*/