resource "azurerm_resource_group" "rgname" {
  name     = "${var.rgname}-${var.environment}"
  location = var.location
}

data "azurerm_client_config" "current" {
}

resource "azurerm_key_vault" "keyvault" {
  name                = var.name
  location            = azurerm_resource_group.rgname.location
  resource_group_name = azurerm_resource_group.rgname.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"
}

resource "azurerm_key_vault_access_policy" "kv_access_policy" {
  key_vault_id = azurerm_key_vault.keyvault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  key_permissions = [
    "Get",
  ]

  secret_permissions = [
    "Get",
  ]
}

data "azuread_service_principal" "sp" {
  display_name = "sp-app"
}

resource "azurerm_key_vault_access_policy" "sp-principal" {
  key_vault_id = azurerm_key_vault.keyvault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azuread_service_principal.sp.object_id

  key_permissions = [
    "Get", "List", "Encrypt", "Decrypt"
  ]
}














/*resource "azurerm_key_vault" "keyvault" {
  name                          = var.name
  resource_group_name           = azurerm_resource_group.rgname.name
  location                      = azurerm_resource_group.rgname.location
  sku_name                      = "standard"
  tenant_id                     = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days    = 7
  enabled_for_disk_encryption   = true
  
  access_policy = {
    object_id          = var.access_policy_id
    tenant_id          = var.tenant_id
    key_permisions     = ["Get", "List", "Encrypt", "Decrypt"]
    secret_permissions = ["Get", "List", "Encrypt", "Decrypt"]
    storage_permissions = ["Get"]
  }
}*/