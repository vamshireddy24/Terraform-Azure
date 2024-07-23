resource "azurerm_resource_group" "rgname" {
  name     = "${var.rgname}-${var.environment}"
  location = var.location
}

resource "azurerm_log_analytics_workspace" "Log_Analytics_Workspace" {
  name                   = var.name
  location               = azurerm_resource_group.rgname.location
  resource_group_name    = azurerm_resource_group.rgname.name
  sku                    = var.log_analytics_workspace_sku

   tags = {
    environment = var.environment
   }
}

resource "azurerm_log_analytics_solution" "name" {
    solution_name         = "ContainerInsights"
    location              = azurerm_log_analytics_workspace.Log_Analytics_Workspace.location
    resource_group_name   = azurerm_resource_group.rgname.name
    workspace_resource_id = azurerm_log_analytics_workspace.Log_Analytics_Workspace.id
    workspace_name        = azurerm_log_analytics_workspace.Log_Analytics_Workspace.name

    plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}



