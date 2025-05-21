# sample comment
module "s3_raw_data" {
  source            = "../modules/s3"
  aws_region        = var.aws_region
  enable_versioning = var.enable_versioning
  sse_algorithm     = var.sse_algorithm
  tags              = var.tags
  organization      = var.organization
  env               = var.env
  team              = var.team
}
