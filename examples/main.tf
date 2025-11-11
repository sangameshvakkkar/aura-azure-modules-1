

resource "azurerm_resource_group" "example" {
  name     = "aura-terra-main"
  location = "East US"

  tags = { "Project" = "AURA" }

}

/*
# Use the VM module
module "vm" {
  source = "../modules/vm"

  resource_group_name  = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  vnet_name           = "aura-vnet-1"
  subnet_name         = "aura-subnet-pv-1"
  vm_name             = "aura-vm-1"
  os_disk_name        = "myosdisk1"
  admin_username      = "aura-admin"
  admin_password      = "Password1234!" # In production, use a secure way to manage passwords
  environment         = "staging"
} 

*/

data "azurerm_client_config" "current" {}

locals {
  key_vault_name = "aura-main-kv"
}
module "avm-res-keyvault-vault" {
  source  = "Azure/avm-res-keyvault-vault/azurerm"
  version = "0.10.2" # insert the 4 required variables here

  name                = local.key_vault_name
  location            = "East US"
  resource_group_name = azurerm_resource_group.example.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name = "standard"


}