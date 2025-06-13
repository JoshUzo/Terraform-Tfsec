variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "iam_role_name" {
  description = "Optional override for IAM role name"
  type        = string
  default     = ""
}

variable "attach_basic_policy" {
  description = "Attach AWSLambdaBasicExecutionRole"
  type        = bool
  default     = false
}

variable "attach_xray_policy" {
  description = "Attach AWSXRayDaemonWriteAccess"
  type        = bool
  default     = false
}

variable "assume_role_services" {
  description = "List of services allowed to assume the role"
  type        = list(string)
  default     = ["lambda.amazonaws.com"]
}

variable "inline_policies" {
  description = "List of inline policies (name + policy_json)"
  type = list(object({
    name        = string
    policy_json = string
  }))
  default = []
}

variable "managed_policy_arns" {
  description = "List of managed policy ARNs to attach"
  type        = list(string)
  default     = []
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "organization" {
  description = "Company or organization prefix"
  type        = string
}

variable "team" {
  description = "Team or project name"
  type        = string
}

variable "env" {
  description = "Deployment environment (dev, uat, prod)"
  type        = string
}

variable "resource_type" {
  description = "Type of resource (e.g., s3, rds, ec2)"
  type        = string
  default     = "iam"
}

variable "purpose" {
  description = "The functional purpose of the iam"
  type        = string
}