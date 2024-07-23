resource "azurerm_resource_group" "rgname" {
  name     = "${var.rgname}-${var.environment}"
  location = var.location
}

resource "azurerm_application_insights" "appinsight" {
  name                   = var.name
  location               = azurerm_resource_group.rgname.location
  resource_group_name    = azurerm_resource_group.rgname.name
  application_type       = var.application_type
}