locals {
  # Construct the bucket name from naming convention
  bucket_name = "${var.organization}-${var.team}-${var.resource_type}-${var.env}"

  # Default tags applied to resources
  default_tags = merge(
    {
      Name       = local.bucket_name
      ManagedBy  = "Terraform"
      Environment = var.env
      Team       = var.team
    },
    var.tags
  )
}