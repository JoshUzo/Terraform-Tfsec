#new comment69
module "lambda_functions" {
  source = "../modules/lambda"
  for_each = local.lambda_configs


  purpose                = each.value.purpose
  handler                = each.value.handler
  runtime                = each.value.runtime

  lambda_s3_bucket       = var.lambda_artifact_bucket
  lambda_s3_key          = each.value.s3_key
  source_code_hash       = each.value.source_code_hash

  role_arn               = each.value.role_arn
  environment_variables  = each.value.environment_variables
  

  create_layer = try(each.value.create_layer, false)
  layer_s3_bucket        = var.lambda_artifact_bucket
  layer_s3_key           = try(each.value.layer_s3_key, "")
  layers       = try(each.value.layers, [])

  organization  = var.organization
  team          = var.team
  env           = var.env
  aws_region    = var.aws_region
  resource_type = "lambda"
}
