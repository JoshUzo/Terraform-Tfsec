locals {
  # Standard naming convention for EC2 name
  instance_name = var.instance_name != "" ? var.instance_name : "${var.organization}-${var.team}-${var.resource_type}-${var.purpose}-${var.env}"

  # Default tags applied to all EC2
  default_tags = {
    ManagedBy   = "Terraform"
    Environment = var.env
    Team        = var.team
    Name       =  local.instance_name
  }

  all_tags = local.default_tags
}