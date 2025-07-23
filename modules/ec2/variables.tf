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

variable "key_name" {
  description = "Name of the AWS key pair to associate with the instance"
  type        = string
  default     = null
}

variable "instance_name" {
  description = "Optional override for EC2 instance name. If empty, name is built from organization, team, resource_type, purpose, and env."
  type        = string
  default     = ""
}

variable "instances" {
  description = <<EOF
Map of EC2 instance definitions.
Each key is the instance name.
Each value should include:
- ami_id
- instance_type
- subnet_id
- security_group_ids (list)
- user_data
- tags (map)
EOF
  type = map(object({
    ami_id              = string
    instance_type       = string
    subnet_id           = string
    security_group_ids  = list(string)
    user_data           = string
  }))
}



