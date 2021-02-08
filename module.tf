module "azure_user_tags" {
  source      = "./azure_user_tags"
  environment = var.environment
  custom_tags = var.custom_tags
}

module "azure_region" {
  source       = "./azure_region"
  azure_region = var.azure_region
}

module "azure_static_website_cdn" {
  access_tier                  = "Hot"
  account_kind                 = "StorageV2"
  allowed_headers              = []
  allowed_methods              = []
  allowed_origins              = []
  assign_identity              = true
  cdn_profile_name             = var.cdn_profile_name
  cdn_sku_profile              = var.cdn_sku_profile
  create_resource_group        = var.create_resource_group
  custom_404_path              = var.custom_404_path
  custom_domain_name           = var.custom_domain_name
  enable_cdn_profile           = var.enable_cdn_profile
  enable_https_traffic         = true
  enable_static_website        = true
  exposed_headers              = []
  friendly_name                = var.friendly_name
  index_path                   = var.index_path
  location                     = module.azure_region.location
  max_age_in_seconds           = var.max_age_in_seconds
  resource_group_name          = azurecaf_name.rg_this.result
  sku                          = "Standard_GRS"
  source                       = "./azure_static_website_cdn"
  static_website_source_folder = var.static_website_source_folder
  storage_account_name         = azurecaf_name.st_this.result
  tags                         = module.azure_user_tags.tags
}
