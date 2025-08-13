locals {
  # Construct the bucket name from naming convention
  bucket_name = "${var.organization}-${var.team}-${var.env}-${var.purpose}"

  # Default tags applied to resources
  default_tags = {
    ManagedBy   = "Terraform"
    Environment = var.env
    Team        = var.team
  }

  
all_tags = local.default_tags
}
