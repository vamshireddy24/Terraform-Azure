resource "azurerm_resource_group" "rgname" {
  name     = "${var.rgname}-${var.environment}"
  location = var.location
}

resource "azurerm_container_registry" "acr" {
    name                = var.name
    resource_group_name = azurerm_resource_group.rgname.name
    location            = azurerm_resource_group.rgname.location
    sku                 = "Premium"
    admin_enabled       = false

    tags = {
        environment = var.environment 
    }
}