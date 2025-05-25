# main comment
provider "aws" {
  region = var.aws_region
}

module "s3_raw_data" {
  source            = "../modules/s3"
  for_each          = toset(var.bucket_name)

  aws_region        = var.aws_region
  enable_versioning = var.enable_versioning
  sse_algorithm     = var.sse_algorithm
  tags              = var.tags
  organization      = var.organization
  env               = var.env
  team              = var.team

  bucket_name       = each.value
}
