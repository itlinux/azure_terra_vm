terraform {
  required_version = "> 0.12.0"
}

provider "azurerm" {
  # The "feature" block is required for AzureRM provider 2.x.
  # If you are using version 1.x, the "features" block is not allowed.
  version = "~>2.0"
  features {}
}
resource "azurerm_resource_group" "it_tf_rg" {
  name     = var.resource_group
  location = var.location
}
