terraform {
    required_version = ">= 1.0"

    required_providers {
      azurerm = {
        source = "hashicorp/azurerm"
        version = "~> 3.0"
      }
      azuread = {
        source = "hashicorp/azuread"
        version = "~> 2.53"
      }
    }
    backend "azurerm" {
      resource_group_name = "varasidhi-tf-rg"
      storage_account_name = "varasiddhiazure"
      container_name = "terraformtfstate"
    }
}

data "azurerm_client_config" "current" {}