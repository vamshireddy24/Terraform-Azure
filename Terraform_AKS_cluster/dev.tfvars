rgname      = "varasidha"
location    = "East US 2"
environment = "dev"
#log Analytics
log_analytics_workspace_name = "devvarasidha-log"
# Virtual Network
vnet_name                   = "devvarasidha-vnet"
network_address_space       = "192.168.0.0/16"
aks_subnet_address_name     = "aks"
aks_subnet_address_prefix   = "192.168.0.0/24"
appgw_subnet_address_name   = "appgw"
appgw_subnet_address_prefix = "192.168.1.0/24"

#AKS
aks_name           = "devvarasidha-aks"
kubernetes_version = "1.23.3"
agent_count        = 2
vm_size            = "Standard_DS2_v2"
ssh_public_key     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCpv/n2/N9aDkRL8aTOhkZ99LeCrLn4aPh6TDcNUxJQlIzjeKZclhendPm0l8ni1K/Ky9YWGTZyjixHC++HNi1nwP9TTukDRl/oNOb4YIag7Cq49VHxbU0SYhombCKCPP9HdeSb0RXzjr9VXA/AM2leS0r/nRr6T0tdzwcAjFcCqXq+DS9X1kmusQBvhR3mSFfnAojI8QSIZuOQCKvGj5C3ifnhzIA7eB04iPHauuhMCZeUbJ2tdVhTs4DdSf/37FKv/169aRhjoZQk39QstNtidEJBuKOykGkZPyAuTcFO92m2aLfeisCugIEeQoon5BIIVJ8SQcug1+kSZCXDve8AATGF200WetnuZ48Fz653ijAT02R14kJUUzb9eQSTuoIDecbCTAouR6i6geWw0uDCqZxjWlbX8t1bQ8Kh/M5/ZdxMJZVsWlgwKbUXo68iUcZoqrGdCPGZ1u8rl0h68dDVQ+h/Lxm4AZLVFePO/MHQnMyRsOXsZl1cwEwmc3qeXjs= chvam@VAKREDDY"

#ACR
acr_name = "devvarasidhaacr"

#Appinsights
appinsight_name   = "devvarasidha-appinsight"
application_type  = "web"

#Key Vault
keyvault_name     = "devvarasidha-kv"
/*access_policy_id  = "17d9ba42-a52f-47ca-a629-ff10266a0068"
tenant_id         = "4130dd4a-310b-444d-9161-0536ea6f94bb"
*/