#1. Terrafom Settings Block
terraform {
#2. Required Terraform Version
    required_version = ">= 1.0"
#3. Required Terraform Provider
    required_providers {
      azurerm = {
        source = "hashicorp/azurerm"
        version = "~> 3.109"        
      }
      azuread = {
        source = "hashicorp/azuread"
        version = "~> 2.52"
      }
    }
#4. Terraform state file storage to azure storage container
    backend "azurerm" {
      resource_group_name = "terraform-storage-rg"
      storage_account_name = "terraformstatefile"
      container_name = "tfstatefiles"
      key = "dev.terraform.tfstate"
    }
}
resource "random_pet" "aksrandom" {
  
}