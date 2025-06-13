locals {
  # Standard naming convention for Lambda function name
  lambda_name = var.lambda_name != "" ? var.lambda_name : "${var.organization}-${var.team}-${var.resource_type}-${var.purpose}-${var.env}"

  # Default tags applied to all Lambda resources
  default_tags = {
    ManagedBy   = "Terraform"
    Environment = var.env
    Team        = var.team
  }

  all_tags = local.default_tags
}
