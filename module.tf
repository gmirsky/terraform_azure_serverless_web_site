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
  source                       = "./azure_static_website_cdn"
  create_resource_group        = var.create_resource_group
  resource_group_name          = azurecaf_name.rg_this.result
  location                     = module.azure_region.location
  storage_account_name         = azurecaf_name.st_this.result
  account_kind                 = "StorageV2" # BlockBlobStorage
  static_website_source_folder = var.static_website_source_folder
  index_path                   = var.index_path
  custom_404_path              = var.custom_404_path
  enable_cdn_profile           = var.enable_cdn_profile
  cdn_profile_name             = var.cdn_profile_name
  cdn_sku_profile              = var.cdn_sku_profile
  custom_domain_name           = var.custom_domain_name
  friendly_name                = var.friendly_name
  tags                         = module.azure_user_tags.tags
}
