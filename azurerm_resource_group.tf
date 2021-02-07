resource "azurerm_resource_group" "this" {
  name     = azurecaf_name.rg_this.result
  location = module.azure_region.location
  tags     = module.azure_user_tags.tags
}