locals {
  # Standard naming convention for Glue Job name
  glue_job = var.glue_job != "" ? var.glue_job : "${var.organization}-${var.team}-${var.purpose}-${var.env}"

  # Default tags applied to all Lambda resources
  default_tags = {
    ManagedBy   = "Terraform"
    Environment = var.env
    Team        = var.team
  }

  all_tags = local.default_tags
}
