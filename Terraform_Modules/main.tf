provider "azurerm" {
    features {      
    }
}

resource "azurerm_resource_group" "rg1" {
    name = var.rgname
    location = var.location
}

module "ServicePrincipal" {
    source = "./modules/ServicePrincipal"
    service_principal_name = var.service_principal_name

     depends_on = [ azurerm_resource_group.rg1 ]
}

resource "azurerm_role_assignment" "rolespn" {
    scope                = "/subscriptions/f573f592-b370-47da-a0bf-8c30ecdee530"
    role_definition_name = "Contributor"
    principal_id         = "[module.ServicePrincipal.data.azuread_client_config.current.object_id]"

    depends_on = [
        module.ServicePrincipal
    ]
}
module "KeyVault" {
    source                      = "./modules/KeyVault"
    keyvault_name               = var.keyvault_name
    location                    = var.location
    rgname                      = var.rgname

  depends_on = [
    module.ServicePrincipal
  ]
}

resource "azurerm_key_vault_secret" "kv" {
    name         = module.ServicePrincipal.client_id
    value        = module.ServicePrincipal.client_secret
    key_vault_id = "[module.KeyVault.azurerm_key_vault.kv.id]"
    
        depends_on = [
            module.KeyVault
        ]
}