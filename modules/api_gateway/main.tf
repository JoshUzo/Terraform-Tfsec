# =============================================================
# Create the API Gateway HTTP API itself
# =============================================================
resource "aws_apigatewayv2_api" "this" {
  name          = local.api_name
  protocol_type = "HTTP"

  # Optional CORS configuration, if cors_config is provided
  dynamic "cors_configuration" {
    for_each = var.cors_config != null ? [1] : []
    content {
      allow_origins  = var.cors_config.allow_origins
      allow_methods  = var.cors_config.allow_methods
      allow_headers  = var.cors_config.allow_headers
      expose_headers = lookup(var.cors_config, "expose_headers", null)
      max_age        = lookup(var.cors_config, "max_age", null)
    }
  }

  tags = local.all_tags
}

# =============================================================
# Create the API Gateway stage
# =============================================================
resource "aws_apigatewayv2_stage" "this" {
  api_id      = aws_apigatewayv2_api.this.id
  name        = var.stage_name
  auto_deploy = true

  # Configure access logs to CloudWatch
  access_log_settings {
    destination_arn = var.logging_config.destination_arn
    format          = var.logging_config.format
  }

  # Configure default logging level for routes
  default_route_settings {
    logging_level = var.logging_config.logging_level
  }

  tags = local.all_tags
}

# =============================================================
# JWT Authorizer
# - Used when integrating with Cognito JWT tokens
# =============================================================
resource "aws_apigatewayv2_authorizer" "jwt" {
  count                             = var.authorizer_config != null && var.authorizer_config.type == "JWT" ? 1 : 0
  name                              = "${local.api_name}-authorizer"
  api_id                            = aws_apigatewayv2_api.this.id
  authorizer_type                   = "JWT"
  identity_sources                  = var.authorizer_config.identity_sources
  authorizer_result_ttl_in_seconds  = 0 # JWT authorizers cannot use caching

  jwt_configuration {
    audience = var.authorizer_config.audience
    issuer   = var.authorizer_config.issuer
  }
}

# =============================================================
# Lambda Authorizer
# - Used when using a custom Lambda function as authorizer
# =============================================================
resource "aws_apigatewayv2_authorizer" "lambda" {
  count                             = var.authorizer_config != null && var.authorizer_config.type == "REQUEST" ? 1 : 0
  name                              = "${local.api_name}-authorizer"
  api_id                            = aws_apigatewayv2_api.this.id
  authorizer_type                   = "REQUEST"
  identity_sources                  = var.authorizer_config.identity_sources
  authorizer_result_ttl_in_seconds  = 300
  authorizer_uri                    = var.authorizer_config.authorizer_uri
}

# =============================================================
# Local variable to compute the authorizer_id dynamically
# =============================================================
locals {
  # Resolve which authorizer ID to use, or null if none
  authorizer_id = (
    var.authorizer_config != null && var.authorizer_config.type == "JWT" ?
      aws_apigatewayv2_authorizer.jwt[0].id :
    var.authorizer_config != null && var.authorizer_config.type == "REQUEST" ?
      aws_apigatewayv2_authorizer.lambda[0].id :
    null
  )
}

# =============================================================
# Integration for each route
# - Connects API Gateway routes to Lambda functions
# =============================================================
resource "aws_apigatewayv2_integration" "this" {
  for_each = { for route in var.routes : route.path => route }

  api_id                     = aws_apigatewayv2_api.this.id
  integration_type           = "AWS_PROXY"
  integration_uri            = each.value.lambda_arn
  integration_method         = "POST"
  payload_format_version     = "2.0"
}

# =============================================================
# API Gateway routes
# - Each route maps a method + path to an integration
# =============================================================
resource "aws_apigatewayv2_route" "this" {
  for_each = { for route in var.routes : route.path => route }

  api_id         = aws_apigatewayv2_api.this.id
  route_key      = "${each.value.method} ${each.key}"
  target         = "integrations/${aws_apigatewayv2_integration.this[each.key].id}"
  authorizer_id  = local.authorizer_id
}

# =============================================================
# Deployment
# - Creates a deployment for the API
# =============================================================
resource "aws_apigatewayv2_deployment" "this" {
  depends_on = [aws_apigatewayv2_route.this]
  api_id     = aws_apigatewayv2_api.this.id
  description = "Deployment for ${var.stage_name}"
}


