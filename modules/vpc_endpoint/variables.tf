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

variable "vpce_name" {
  type        = string
  description = "API Gateway name override"
  default     = ""
}

variable "vpc_id" {
  description = "ID of the VPC where the endpoint will be created"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs where the VPC endpoint will be placed (used only for interface endpoints)"
  type        = list(string)
  default     = []
}

variable "security_group_ids" {
  description = "List of security group IDs to attach to the endpoint network interfaces (only for interface endpoints)"
  type        = list(string)
  default     = []
}

variable "endpoint_type" {
  description = "Type of VPC endpoint: Interface or Gateway"
  type        = string
  validation {
    condition     = contains(["Interface", "Gateway"], var.endpoint_type)
    error_message = "endpoint_type must be either 'Interface' or 'Gateway'."
  }
}

variable "service_name" {
  description = "The AWS service name or custom service name for the VPC endpoint"
  type        = string
}

variable "private_dns_enabled" {
  description = "Whether private DNS is enabled for the endpoint (only for interface endpoints)"
  type        = bool
  default     = true
}

variable "policy_document" {
  description = "JSON policy document to attach to the VPC endpoint. Optional."
  type        = string
  default     = null
}

variable "route_table_ids" {
  description = "List of route table IDs to associate with the VPC endpoint (for Gateway endpoints)"
  type        = list(string)
  default     = []
}

