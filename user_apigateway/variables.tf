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
  description = "Functional purpose of the Api Gateway"
  type        = string
}

variable "stage_name" {
  description = "Deployment stage name (e.g., dev, uat, prod)"
  type        = string
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