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

variable "key_name" {
  description = "Name of the AWS key pair to associate with the instance"
  type        = string
  default     = null
}

variable "instance_name" {
  type        = string
  description = "Optional override for EC2 instance name"
  default     = ""
}

variable "instances" {
  description = "Map of EC2 instances to deploy for SonarQube"
  type = map(object({
    ami_id              = string
    instance_type       = string
    subnet_id           = string
    security_group_ids  = list(string)
    user_data           = string
  }))
}

