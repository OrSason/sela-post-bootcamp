
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

variable "admin_username" {
    default = "azureuser"
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

variable "jenkins_user"{

}

variable "jenkins_pass"{
}


variable "azure_storage_account"{
}

variable "azure_storage_key"{

    sensitive = true
}

