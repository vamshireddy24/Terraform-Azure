# Terraform Resource to create Azre Resource Group with Input Variables defined in variables.terraform 
resource "azurerm_resource_group" "aks_rg" {
  name = "${var.resource_group_name}-${var.environment}"
  location = var.location
}

