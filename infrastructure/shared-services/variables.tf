
variable "resourceGroupName"{
   type = string
   default= "aks-shared"
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

variable "ssh_key" {
    default = "~/.ssh/id_rsa2.pub"
}

variable "cluster_name" {
  description = "The name for the AKS cluster"
  default     = "sharedAKS"
}
variable "env_name" {
  description = "The environment for the AKS cluster"
  default     = "shared"
}

variable "registry_name" {
  description = "the name of the container registry"
  
}