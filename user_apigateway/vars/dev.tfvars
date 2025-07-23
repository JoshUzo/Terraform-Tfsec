stage_name    = "dev"
organization  = "htown"
team          = "sp"
resource_type = "apigateway"
purpose       = "Rockets"
env           = "dev"
aws_region    = "us-east-2"

cors_config = {
  allow_origins  = ["*"]
  allow_methods  = ["GET", "POST", "OPTIONS"]
  allow_headers  = ["Content-Type", "Authorization"]
  expose_headers = ["X-Custom-Header"]
  max_age        = 3600
}

