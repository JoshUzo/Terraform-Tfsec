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

variable "vpc_id" {
  description = "ID of the VPC where the endpoint will be created"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the endpoint"
  type        = list(string)
  default     = []
}

variable "security_group_ids" {
  description = "List of security group IDs for interface endpoints"
  type        = list(string)
  default     = []
}

variable "endpoint_type" {
  description = "Type of VPC endpoint: Interface or Gateway"
  type        = string
}

variable "service_name" {
  description = "AWS service or PrivateLink service name"
  type        = string
}

variable "private_dns_enabled" {
  description = "Whether private DNS is enabled for interface endpoints"
  type        = bool
  default     = true
}

variable "policy_document" {
  description = "Optional policy document for the VPC endpoint"
  type        = string
  default     = null
}

