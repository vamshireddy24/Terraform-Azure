# Azure Location
variable "location" {
  type = string
  description = "Azure Region"
  default = "Central Us"
}

# Azure Resource Group Name
variable "resource_group_name" {
  type = string
  description = "this variable defines the Resource group"
  default = "terraform-aks"
}

# Azure AKS environment Name
variable "environment" {
    type = string
    description = "this variable defines the Environment"
    default = "dev"  
}


# AKS input variables

# SSH Public key for Linux Vms
variable "ssh_public_key" {
  default = "~/.ssh/aks-prod-sshkeys-terraform/aksprodsshkey.pub"
  description = "This variable defines the SSH public key for Linux k8s worker node"
}

# Windows admin username for k8s workernode
variable "windows_admin_username" {
  type = string
  default = "azureuser"
  description = "This variable defines windows admin username for Linux k8s worker node"
}

# windows admin password for k8s workernode

variable "windows_admin_password" {
  type = string
  default = "azureuser@123"
  description = "This variable defines the windows admin password for Linux k8s worker node"
}