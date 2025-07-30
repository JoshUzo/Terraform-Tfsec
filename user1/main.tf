#this is mainv19

locals {
  s3_buckets = {
    brown = {
      purpose = "brown"
      }
    }
    blue = {
      purpose = "blue"
    }
    logs = {
      purpose = "logs"
    }
    data = {
      purpose = "data"
    }
  }


module "s3_raw_data" {
  source            = "../modules/s3"
  for_each          = local.s3_buckets

  purpose           = each.value.purpose
  resource_type     = var.resource_type
  aws_region        = var.aws_region
  enable_versioning = var.enable_versioning
  sse_algorithm     = var.sse_algorithm
  organization      = var.organization
  env               = var.env
  team              = var.team
}
