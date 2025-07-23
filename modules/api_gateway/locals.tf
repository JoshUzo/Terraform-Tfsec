locals {
  # Standard naming convention for Api Gateway name
  api_name = var.api_name != "" ? var.api_name : "${var.organization}-${var.team}-${var.resource_type}-${var.purpose}-${var.env}"

  # Default tags applied to all Api Gateway
  default_tags = {
    ManagedBy   = "Terraform"
    Environment = var.env
    Team        = var.team
  }

  all_tags = local.default_tags
}