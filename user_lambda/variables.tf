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

variable "function_config" {
  type = map(object({
    purpose               = string
    handler               = string
    runtime               = string
    role_arn              = string
    environment_variables = map(string)
    s3_key                = string
    source_code_hash      = optional(string)
    create_layer          = optional(bool)
    layer_s3_key          = optional(string)
    layers                = optional(list(string))
    s3_event = optional(object({
      bucket         = string
      events         = list(string)
      filter_prefix  = optional(string)
      filter_suffix  = optional(string)
    }))
  }))
}

variable "source_code_hashes" {
  type = map(object({
    source_code_hash = string
  }))
  default = {}
}

variable "lambda_artifact_bucket" {
  description = "S3 bucket where Lambda and Layer ZIPs are stored"
  type        = string
}


