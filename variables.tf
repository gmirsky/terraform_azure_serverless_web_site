variable "azure_region" {
  type        = string
  description = "Azure Region in slug format"
}

variable "environment" {
  type        = string
  description = "Environment value"
  validation {
    condition = can(
      regex(
        "dev|test|qa|prod",
        var.environment
      )
    )
    error_message = "ERROR: environment must be of type: dev, test, qa or prod."
  }
}

variable "custom_tags" {
  type        = map(string)
  description = "Custom Azure tags provided by the user"
  default = {
  }
}

variable "application_code_name" {
  type        = string
  description = "application code or abbreviation to be used in resource names"
}

variable "cidr_first_two_octets" {
  type        = string
  description = "Fist two octets of the network CIDR"
  default     = "10.0"
}

variable "create_resource_group" {
  description = "Switch to create resource group or not. Possible values are `true` or `false`."
  default     = false
}

variable "custom_domain_name" {
  type        = string
  description = "Custome Domain Name"
}

variable "friendly_name" {
  type        = string
  description = "The friendly name of your custom domain in the Azure Portal"
}

variable "sku" {
  description = "The SKU of the storage account."
  default     = "Standard_GRS"
}

variable "access_tier" {
  description = "The access tier of the storage account."
  default     = "Hot"
}

variable "enable_https_traffic" {
  description = "Configure the storage account to accept requests from secure connections only. Possible values are `true` or `false`"
  default     = true
}

variable "enable_static_website" {
  description = "Controls if static website to be enabled on the storage account. Possible values are `true` or `false`"
  default     = true
}

variable "static_website_source_folder" {
  description = "Set a source folder path to copy static website files to static website storage blob"
  default     = ""
}

variable "assign_identity" {
  description = "Specifies the identity type of the Storage Account. At this time the only allowed value is SystemAssigned."
  default     = true
}

variable "enable_cdn_profile" {
  description = "Controls the creation of CDN profile and endpoint for static website. Possible values are `true` or `false`"
  default     = false
}

variable "cdn_profile_name" {
  description = "Specifies the name of the CDN Profile"
  default     = ""
}

variable "cdn_sku_profile" {
  description = "The pricing related information of current CDN profile. Accepted values are 'Standard_Akamai', 'Standard_ChinaCdn', 'Standard_Microsoft', 'Standard_Verizon' or 'Premium_Verizon'."
  default     = "Standard_Akamai"
  validation {
    condition = can(
      regex(
        "Standard_Akamai|Standard_ChinaCdn|Standard_Microsoft|Standard_Verizon|Premium_Verizon",
        var.cdn_sku_profile
      )
    )
    error_message = "ERROR: cdn_sku_profile must be of type: 'Standard_Akamai', 'Standard_ChinaCdn', 'Standard_Microsoft', 'Standard_Verizon' or 'Premium_Verizon'."
  }
}

variable "index_path" {
  description = "path from your repo root to index.html"
  default     = "index.html"
}

variable "custom_404_path" {
  description = "path from your repo root to your custom 404 page"
  default     = "404.html"
}

variable "allowed_methods" {
  type        = list(string)
  description = " A list of http headers that are allowed to be executed by the origin. Valid options are `DELETE`, `GET`, `HEAD`, `MERGE`, `POST`, `OPTIONS`, `PUT` or `PATCH`."
  default = [
    "GET",
    "HEAD"
  ]
}

variable "allowed_origins" {
  type        = list(string)
  description = "A list of origin domains that will be allowed by CORS."
  default     = ["*"]
}

variable "allowed_headers" {
  type        = list(string)
  description = "A list of headers that are allowed to be a part of the cross-origin request."
  default     = []
}

variable "exposed_headers" {
  type        = list(string)
  description = "A list of response headers that are exposed to CORS clients."
  default     = []
}

variable "max_age_in_seconds" {
  type        = number
  description = "The number of seconds the client should cache a preflight response.  Defaults to 2 days"
  default     = 60 * 60 * 24 * 2
}
