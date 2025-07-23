module "api_gateway" {
  source = "../modules/api_gateway"

  stage_name  = var.stage_name

  cors_config = var.cors_config

  routes = [
    {
      path       = "/hello"
      method     = "GET"
      lambda_arn = "arn:aws:lambda:us-east-2:211125625532:function:hello-tf-lambda"
    },
    {
      path       = "/goodbye"
      method     = "POST"
      lambda_arn = "arn:aws:lambda:us-east-2:211125625532:function:htown-sp-lambda-transform-dev"
    }
  ]

  authorizer_config = {
    type             = "JWT"
    identity_sources = ["$request.header.Authorization"]
    audience         = ["7dc4j4mnsnmj3se3ihibqt0pm2"]
    issuer           = "https://cognito-idp.us-east-2.amazonaws.com/us-east-2_Zs5W6hUFG"
  }


  logging_config = {
    destination_arn = "arn:aws:logs:us-east-2:211125625532:log-group:/aws/apigateway/htown-logs:*"
    format          = "{\"requestId\":\"$context.requestId\",\"status\":\"$context.status\"}"
    logging_level   = "INFO"
  }


  organization   = var.organization
  team           = var.team
  aws_region     = var.aws_region
  resource_type  = var.resource_type
  purpose        = var.purpose
  env            = var.env

}
