

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.env_name}-AKS"
  location            = var.location
  resource_group_name = var.resourceGroupName
  dns_prefix          = "${var.env_name}-AKS"
  

  default_node_pool {
    name       = "${var.env_name}np"
    enable_auto_scaling = false
    node_count = 1
    #for autoscaling uncomment next 3
    #enable_auto_scaling = true
    #max_count =  5
    #min_count =  2
    
    vm_size    = var.node_size
    type       = "VirtualMachineScaleSets"
    os_disk_size_gb = 250
  }

  service_principal  {
    client_id = var.serviceprinciple_id
    client_secret = var.serviceprinciple_key
  }

  linux_profile {
    admin_username = var.admin_username
    ssh_key {
        key_data = var.ssh_key
    }
  }

  addon_profile {
    aci_connector_linux {
      enabled = false
    }

    azure_policy {
      enabled = false
    }

    http_application_routing {
      enabled = false
    }

    kube_dashboard {
      enabled = false
    }

    oms_agent {
      enabled = false
    }
  }


  tags = {
    Environment = var.env_name
  }
}