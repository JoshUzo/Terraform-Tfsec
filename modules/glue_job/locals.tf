locals {
  # Standard naming convention for Glue Job name 
  glue_job_name = "${var.organization}-${var.team}-${var.purpose}-${var.env}"

  # Default tags applied to all Glue resources
  default_tags = {
    ManagedBy   = "Terraform"
    Environment = var.env
    Team        = var.team
    Component   = "glue-job"
  }

  all_tags = local.default_tags
}

