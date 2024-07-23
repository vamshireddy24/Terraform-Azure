resource "azurerm_resource_group" "rgname" {
  name     = "${var.rgname}-${var.environment}"
  location = var.location
}
resource "azuread_group" "aks_administrators" {
  display_name = "${azurerm_resource_group.rgname.name}-cluster-administrators"
  security_enabled = true
  description = "Azure AKS kubernetes administrators fir ${azurerm_resource_group.rgname.name}-cluster"
}

data "azurerm_kubernetes_service_versions" "current" {
    location = var.location
    include_preview = false
}

resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                   = var.name
  location               = azurerm_resource_group.rgname.location
  resource_group_name    = azurerm_resource_group.rgname.name
  dns_prefix             = "${azurerm_resource_group.rgname.name}-cluster"
  kubernetes_version     = data.azurerm_kubernetes_service_versions.current.latest_version
  node_resource_group    = "${azurerm_resource_group.rgname.name}-nrg"

  default_node_pool {
    name                 = "systempool"
    vm_size              = var.vm_size
    vnet_subnet_id       = var.aks_subnet
    orchestrator_version = data.azurerm_kubernetes_service_versions.current.latest_version
    zones                = [1,2]
    node_count           = var.agent_count
    os_disk_size_gb      = 30
    type                 = "VirtualMachineScaleSets"
    node_labels = {
     "nodepool-type" = "system"
     "environmet"    = "dev"
     "nodepools"     = "linux"
     "app"           = "system-apps"
    }
  }
  identity {
    type = "SystemAssigned"
  }
    tags = {
      environment   = var.environment
      nodepools     = "linux"
      app           = "system-apps"
      nodepool-type = "system"
    }

  oms_agent {
    log_analytics_workspace_id = var.log_analytics_workspace_id
  }
      
  ingress_application_gateway {
    gateway_name  = var.addons.ingress_application_gateway
    subnet_id     = var.agic_subnet_id
  }

  azure_active_directory_role_based_access_control {
    admin_group_object_ids = [azuread_group.aks_administrators.id]
    managed                = true
  }
  

  windows_profile {
    admin_username = var.windows_admin_username
    admin_password = var.windows_admin_password
  }

  linux_profile {
    admin_username = "ubuntu"
    ssh_key {
      key_data     = var.ssh_public_key
    }
  }
      
  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
  }
}

