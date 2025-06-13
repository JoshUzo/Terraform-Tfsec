resource "aws_lambda_function" "this" {
  function_name    = local.lambda_name
  handler          = var.handler
  runtime          = var.runtime
  role             = var.role_arn
  filename         = var.filename
  source_code_hash = filebase64sha256(var.filename)

  environment {
    variables = var.environment_variables
  }

  tags = local.all_tags
}
