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
  default     = "lambda"
}

variable "purpose" {
  description = "Functional purpose of the Lambda"
  type        = string
}

variable "lambda_name" {
  description = "Override for Lambda name"
  type        = string
  default     = ""
}

variable "handler" {
  description = "Function entry point"
  type        = string
}

variable "runtime" {
  description = "Lambda runtime (e.g., python3.9)"
  type        = string
}

variable "filename" {
  description = "Path to the zipped Lambda function code"
  type        = string
}

variable "source_code_hash" {
  description = "Base64-encoded SHA256 hash of the deployment package"
  type        = string
}

variable "role_arn" {
  description = "ARN of the IAM role assumed by Lambda"
  type        = string
}

variable "timeout" {
  description = "Maximum function runtime in seconds"
  type        = number
  default     = 3
}

variable "memory_size" {
  description = "Memory size in MB"
  type        = number
  default     = 128
}

variable "environment_variables" {
  description = "Map of environment variables for the Lambda"
  type        = map(string)
  default     = {}
}