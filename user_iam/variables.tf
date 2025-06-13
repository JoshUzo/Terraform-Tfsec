variable "aws_region" {
  description = "AWS region"
  type        = string
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

variable "iam_roles" {
  type = map(object({
    purpose              = string
    assume_role_services = list(string)
    attach_basic_policy  = bool
    attach_xray_policy   = bool
    inline_policies = list(object({
      name        = string
      policy_json = string
    }))
    managed_policy_arns = list(string)
  }))
}