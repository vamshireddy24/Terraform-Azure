provider "azurerm" {
  skip_provider_registration = true
  features {}
}

module "log_analytics" {
  source                       = "./modules/log_analytics"
  name                         = var.log_analytics_workspace_name
  rgname                       = var.rgname
  location                     = var.location
  log_analytics_workspace_sku  = "PerGB2018"
  environment                  = var.environment
}

module "vnet" {
  source                      = "./modules/vnet"
  name                        = var.vnet_name
  location                    = var.location
  rgname                      = var.rgname
  network_address_space       = var.network_address_space
  aks_subnet_address_name     = var.aks_subnet_address_name
  aks_subnet_address_prefix   = var.aks_subnet_address_prefix
  appgw_subnet_address_name   = var.appgw_subnet_address_name
  appgw_subnet_address_prefix = var.appgw_subnet_address_prefix
  environment                 = var.environment
}

module "aks" {
  source                     = "./modules/aks"
  name                       = var.aks_name
  rgname                     = var.rgname
  kubernetes_version         = var.kubernetes_version
  agent_count                = var.agent_count
  vm_size                    = var.vm_size
  location                   = var.location
  ssh_public_key             = var.ssh_public_key
  log_analytics_workspace_id = module.log_analytics.id
  aks_subnet                 = module.vnet.aks_subnet_id
  agic_subnet_id             = module.vnet.appgw_subnet_id
  environment                = var.environment

  addons = {
    oms_agent       = true
    azure_policy    = false
    ingress_application_gateway = true
  }
}

module "acr" {
  source      = "./modules/acr"
  name        = var.acr_name
  rgname      = var.rgname
  location    = var.location
  environment = var.environment
}

resource "azurerm_role_assignment" "aks-acr-rg" {
  scope                = module.acr.resource_group_id
  role_definition_name = "Acrpull"
  principal_id         = module.aks.kubelet_object_id

  depends_on = [
    module.aks,
    module.acr
  ]
}

module "appinsight" {
  source            = "./modules/appinsight"
  name              = var.appinsight_name
  rgname         = var.rgname
  location          = var.location
  environment       = var.environment
  application_type  = var.application_type

  depends_on = [ 
    module.aks,
    module.acr
   ]
}

module "keyvault" {
  source            = "./modules/keyvault"
  name              = var.keyvault_name
  rgname          = var.rgname
  environment       = var.environment
  location          = var.location

  depends_on = [ 
    module.aks,
    module.acr
   ]
}