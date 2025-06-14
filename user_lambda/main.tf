#new comment4
module "lambda_functions" {
  source = "../modules/lambda"
  for_each = var.lambda_functions

  purpose                = each.value.purpose
  handler                = each.value.handler
  runtime                = each.value.runtime
  filename               = each.value.filename
  role_arn               = each.value.role_arn
  environment_variables  = each.value.environment_variables
  source_code_hash       = filebase64sha256(each.value.filename)

  organization  = var.organization
  team          = var.team
  env           = var.env
  aws_region    = var.aws_region
  resource_type = "lambda"
}