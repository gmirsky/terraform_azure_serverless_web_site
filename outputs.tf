output "tags" {
  value = module.azure_user_tags.tags
}

output "location" {
  value       = module.azure_region.location
  description = "Converted Azure region in standard format"
}

output "location_short" {
  value       = module.azure_region.location_short
  description = "Converted Azure region in short format for resource naming purpose"
}

output "location_cli" {
  value       = module.azure_region.location_cli
  description = "Converted Azure region in Azure CLI name format"
}

output "this_rg_name" {
  value       = azurecaf_name.rg_this.result
  description = "Name for rg this"
}