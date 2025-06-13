locals {
  # Construct the bucket name from naming convention
  bucket_name = "${var.organization}-${var.team}-${var.resource_type}-${var.purpose}-${var.env}"

  # Default tags applied to resources
  default_tags = {
    ManagedBy   = "Terraform"
    Environment = var.env
    Team        = var.team
  }

  
all_tags = merge(default_tags, var.additional_tags)
}
