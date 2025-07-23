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
    create_layer          = optional(bool)
    layer_zip             = optional(string)
    layers                = optional(list(string))
    s3_event = optional(object({
      bucket         = string
      events         = list(string)
      filter_prefix  = optional(string)
      filter_suffix  = optional(string)
    }))
  }))
}


