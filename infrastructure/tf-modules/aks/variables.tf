
variable "serviceprinciple_id" {
}

variable "serviceprinciple_key" {
}


variable "resourceGroupName"{
   type = string
   description = "Name of resource group"
}

variable "location"{
   type = string
   description = "Name of resource group"
}


variable "kubernetes_version" {
    default = "1.16.10"
}

variable "ssh_key" {
}


variable "node_size"{
   type = string
   description = "location of resource group"
}



variable "env_name" {
  description = "The environment for the AKS cluster"
}

variable "admin_username" {
    default = "azureuser"
}
