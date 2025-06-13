variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "organization" {
  type = string
}

variable "team" {
  type = string
}

variable "env" {
  type = string
}

variable "lambda_functions" {
  type = map(object({
    purpose               = string
    handler               = string
    runtime               = string
    filename              = string
    role_arn              = string
    environment_variables = map(string)
  }))
}