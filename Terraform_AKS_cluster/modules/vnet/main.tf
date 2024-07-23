resource "azurerm_resource_group" "rgname" {
  name     = "${var.rgname}-${var.environment}"
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.name
  location            = azurerm_resource_group.rgname.location
  resource_group_name = azurerm_resource_group.rgname.name
  address_space       = [var.network_address_space]

   tags = {
    Environment       = var.environment
  }
}

resource "azurerm_subnet" "aks_subnet" {
  name                  = var.aks_subnet_address_name
  resource_group_name   = azurerm_resource_group.rgname.name
  virtual_network_name  = azurerm_virtual_network.vnet.name
  address_prefixes      = [var.aks_subnet_address_prefix]
}

resource "azurerm_subnet" "appgw_subnet" {
  name                 = var.appgw_subnet_address_name
  resource_group_name  = azurerm_resource_group.rgname.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.appgw_subnet_address_prefix]
}