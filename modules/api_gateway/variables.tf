variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "organization" {
  description = "Organization name used in naming"
  type        = string
}

variable "team" {
  description = "Team or project name"
  type        = string
}

variable "env" {
  description = "Environment name (dev, uat, prod)"
  type        = string
}

variable "resource_type" {
  description = "Type of AWS resource"
  type        = string
  default     = ""
}

variable "purpose" {
  description = "Functional purpose of the Lambda"
  type        = string
}

variable "api_name" {
  type        = string
  description = "API Gateway name override"
  default     = ""
}

variable "stage_name" {
  description = "Deployment stage name (e.g., dev, uat, prod)"
  type        = string
}

variable "routes" {
  description = "List of route objects with path, method, and Lambda ARN"
  type = list(object({
    path       = string
    method     = string
    lambda_arn = string
  }))
}

variable "authorizer_config" {
  description = "Configuration for API Gateway authorizer"
  type = object({
    type             = string
    authorizer_uri   = optional(string)
    identity_sources = list(string)
    audience         = optional(list(string))
    issuer           = optional(string)
  })
  default = null
}

variable "logging_config" {
  description = "CloudWatch logging settings"
  type = object({
    destination_arn = string
    format          = string
    logging_level   = string
  })
}

variable "cors_config" {
  description = "CORS configuration for API Gateway HTTP API"
  type = object({
    allow_origins  = list(string)
    allow_methods  = list(string)
    allow_headers  = list(string)
    expose_headers = optional(list(string))
    max_age        = optional(number)
  })
  default = null
}
