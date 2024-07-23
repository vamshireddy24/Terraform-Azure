variable "name" {
}

variable "rgname" {
}

variable "location" {
    type = string
}
variable "environment" {
}

variable "kubernetes_version" {
}

variable "ssh_public_key" {
  default = "~/.ssh/id_rsa.pub"
}

variable log_analytics_workspace_id {
}

variable "agent_count" {
  
}
variable "vm_size" {
}

variable aks_subnet {
}

variable agic_subnet_id {
}
variable "kubernetes_cluster_rbac_enabled" {
  default = true
}

variable "aks_admins_group_object_id" {
  default = "e97b6454-3fa1-499e-8e5c-5d631e9ca4d1"
}

variable "addons" {
  description = "Defines which addons will be activated."
  type = object({
    oms_agent            = bool
    azure_policy         = bool
    ingress_application_gateway = bool
  })
}

variable "windows_admin_username" {
  type = string
  default = "azureuser"
  description = "This variable defines windows admin username for Linux k8s worker node"
}

# windows admin password for k8s workernode

variable "windows_admin_password" {
  type = string
  default = "azureuser@1234"
  description = "This variable defines the windows admin password for Linux k8s worker node"
}
