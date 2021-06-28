
variable "resourceGroupName"{
   type = string
   default="aks-prod"
   description = "Name of resource group"
}

variable "location"{
   type = string
   description = "Name of resource group"
}

variable "node_size" {
    default = "Standard_D2_v2"
}


variable "subscription_id"{
}

variable "serviceprinciple_id"{
}
variable "serviceprinciple_key"{
}
variable "tenant_id"{
}

variable "admin_username" {
    default = "azureuser"
}

variable "ssh_key" {
    default = "~/.ssh/id_rsa2.pub"
}

variable "cluster_name" {
  description = "The name for the AKS cluster"
  default     = "prodAKS"
}
variable "env_name" {
  description = "The environment for the AKS cluster"
  default     = "prod"
}