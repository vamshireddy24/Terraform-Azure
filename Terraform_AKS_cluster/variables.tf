variable "rgname" {
    type = string
    description = "Resource_Group_name"
}
variable "location" {
    type = string
}
variable "environment" {
}

variable "log_analytics_workspace_name" {
  type = string
  description = "Log Analytics workspace Name"
}

variable "vnet_name" {
  type = string
  description = "value"
}

variable "network_address_space" {
  type = string
  description = "Virtual Network Address Space"
}

variable "aks_subnet_address_name" {
  type = string
  description = "AKS Subnet name"
}

variable "aks_subnet_address_prefix" {
  type = string
  description = "AKS Subnet Address Prefix"
}

variable "appgw_subnet_address_name" {
  type = string
  description = "AppGW Subnet Name"
}

variable "appgw_subnet_address_prefix" {
  type = string
  description = "AppGW Subnet Address Prefix"
}

variable "aks_name" {
  type = string
  description = "AKS Name"
}

variable "kubernetes_version" {
  type = string
  description = "AKS K8s Version"
}

variable "agent_count" {
  type = string
  description = "AKS Agent Count"
}

variable "vm_size" {
  type = string
  description = "AKS VM Size"
}

variable "acr_name" {
    type = string
    description = "ACR Name"
}

variable "ssh_public_key" {
  type = string
  description = "SSH key for AKS Cluster"
}

variable "appinsight_name" {
  type = string
  description = "Application Insight Name"
}

variable "application_type" {
  type = string
  description = "Application Insight Type"
}

variable "keyvault_name" {
  type = string
  description = "Key Vault Name"
}

/*variable "access_policy_id" {
  type = string
  description = "Object ID for Key Vault Policy"
}*/