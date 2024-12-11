provider "azurerm" {
  features {}
  subscription_id = "f0e483fc-9d2f-4a4b-8aee-887a398ff27e"
}

variable "location" {
  description = "The location/region where the resource group will be created."
  type        = string
  default     = "West Europe"
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-terraform-storageaccount"
  location = var.location
}

module "storageaccount" {
  source  = "staal-it/storageaccount/azure"
  version = "0.1.4"

  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "westeurope"
}
