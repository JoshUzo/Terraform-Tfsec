module "s3_raw_data" {
  source            = "../modules/s3"
  bucket_name       = var.bucket_name
  enable_versioning = var.enable_versioning
  sse_algorithm     = var.sse_algorithm
  tags              = var.tags
}
