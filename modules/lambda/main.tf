resource "aws_lambda_function" "this" {
  function_name    = local.lambda_name
  handler          = var.handler
  runtime          = var.runtime
  role             = var.role_arn
  timeout          = var.timeout
  memory_size      = var.memory_size
  
# Use S3-based source instead of local filename
  s3_bucket         = var.lambda_s3_bucket
  s3_key            = var.lambda_s3_key
  source_code_hash  = var.source_code_hash


  layers = (
  var.create_layer ?
  [aws_lambda_layer_version.this[0].arn] :
  var.layers
)

  environment {
    variables = var.environment_variables
  }

   tags = local.all_tags
}

resource "aws_lambda_permission" "s3_invoke" {
  count = var.s3_event != null ? 1 : 0

  statement_id  = "AllowExecutionFromS3"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.this.arn
  principal     = "s3.amazonaws.com"
  source_arn    = "arn:aws:s3:::${var.s3_event.bucket}"
}

resource "aws_s3_bucket_notification" "lambda_trigger" {
  count = var.s3_event != null ? 1 : 0

  bucket = var.s3_event.bucket

  lambda_function {
    lambda_function_arn = aws_lambda_function.this.arn
    events              = var.s3_event.events
    filter_prefix       = try(var.s3_event.filter_prefix, null)
    filter_suffix       = try(var.s3_event.filter_suffix, null)
  }

  depends_on = [aws_lambda_permission.s3_invoke]
}

resource "aws_lambda_layer_version" "this" {
  count = var.create_layer ? 1 : 0

  s3_bucket            = var.layer_s3_bucket
  s3_key               = var.layer_s3_key
  layer_name           = "${var.organization}-${var.team}-layer-${var.env}-${var.purpose}"
  compatible_runtimes  = [var.runtime]
}

