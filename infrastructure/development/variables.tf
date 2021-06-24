
variable "resourceGroupName"{
   type = string
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
  default     = "devAKS"
}
variable "env_name" {
  description = "The environment for the AKS cluster"
  default     = "dev"
}