resource "azurecaf_name" "rg_this" {
  name          = var.application_code_name
  resource_type = "azurerm_resource_group"
  #prefixes        = ["a", "b"]
  suffixes      = [var.environment]
  random_length = 5
  clean_input   = true
  use_slug      = true
}

resource "azurecaf_name" "st_this" {
  name          = var.application_code_name
  resource_type = "azurerm_storage_account"
  #prefixes        = ["a", "b"]
  suffixes      = [var.environment]
  random_length = 5
  clean_input   = true
  use_slug      = true
}