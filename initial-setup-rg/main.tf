terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.11.0"
    }
  }
}


locals {
  default_tags = {
    environment = "Dev"
    project     = "dtx"
    owner       = "suraj"
    app-id      = "APP-1001" ## APP ID from reff
  }
}

provider "azurerm" {
  features {}

}


resource "azurerm_resource_group" "example" {
  name     = "rg-dtx-main"
  location = "East US"

  tags = local.default_tags
}


resource "azurerm_storage_account" "example" {
  name                     = "dtxtfstatesa"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = local.default_tags
}

output "tf-state-sa-name" {
  value = azurerm_storage_account.example.name
}