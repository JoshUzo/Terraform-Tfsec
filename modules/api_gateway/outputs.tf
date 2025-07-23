# =============================================================
# Outputs the unique ID of the API Gateway HTTP API
# Useful for references in other modules or resources
# =============================================================
output "api_gateway_id" {
  value = aws_apigatewayv2_api.this.id
}

# =============================================================
# Outputs the endpoint URL to invoke your API
# Example: https://abc123.execute-api.us-east-2.amazonaws.com/dev
# =============================================================
output "api_endpoint" {
  value = aws_apigatewayv2_api.this.api_endpoint
}

# =============================================================
# Outputs the stage name (e.g. dev, uat, prod)
# =============================================================
output "stage_name" {
  value = aws_apigatewayv2_stage.this.name
}

# =============================================================
# Outputs the authorizer ID if an authorizer was created
# Returns null if no authorizer is configured
# =============================================================
output "authorizer_id" {
  description = "The ID of the API Gateway authorizer, if configured"
  value       = local.authorizer_id
}
