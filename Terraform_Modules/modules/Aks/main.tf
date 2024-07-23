# Datasource to get Latest Azure AKS latest Version
data "azurerm_kubernetes_service_versions" "current" {
  location = var.location
  include_preview = false  
}


resource "azurerm_kubernetes_cluster" "aks-cluster" {
  name                  = "aks-cluster"
  location              = var.location
  resource_group_name   = var.rgname
  dns_prefix            = "${var.rgname}-cluster"           
  kubernetes_version    =  data.azurerm_kubernetes_service_versions.current.latest_version
  node_resource_group   = "${var.rgname}-nrg"
  
  default_node_pool {
    name       = "defaultpool"
    vm_size    = "Standard_DS2_v2"
    zones   = [1, 2, 3]
    enable_auto_scaling  = true
    max_count            = 3
    min_count            = 1
    os_disk_size_gb      = 30
    type                 = "VirtualMachineScaleSets"
    node_labels = {
      "nodepool-type"    = "system"
      "environment"      = "prod"
      "nodepoolos"       = "linux"
     } 
   tags = {
      "nodepool-type"    = "system"
      "environment"      = "prod"
      "nodepoolos"       = "linux"
   } 
  }

  service_principal  {
    client_id = azuread_application.main.client_id
    client_secret = azurerm_service_principal_password.main_password.value
  }



  linux_profile {
    admin_username = "ubuntu"
    ssh_key {
        key_data = file(var.ssh_public_key)
    }
  }

  network_profile {
      network_plugin = "azure"
      load_balancer_sku = "standard"
  }

    
}