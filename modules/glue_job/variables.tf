variable "organization" {
  description = "Org prefix used in naming (e.g., htown)"
  type        = string
}

variable "team" {
  description = "Team/application prefix (e.g., sp)"
  type        = string
}

variable "env" {
  description = "Environment name (e.g., dev, uat, prod)"
  type        = string
}

variable "name" {
  description = "Logical name of the Glue job (without prefixes/suffixes)"
  type        = string
}

variable "role_arn" {
  description = "IAM role ARN that the Glue job will assume"
  type        = string
}

variable "script_location" {
  description = "S3 location of the Glue ETL script (e.g., s3://bucket/scripts/job.py)"
  type        = string
}

variable "glue_version" {
  description = "AWS Glue version (e.g., 4.0)"
  type        = string
  default     = "4.0"
}

variable "max_retries" {
  description = "Number of times to retry the job if it fails"
  type        = number
  default     = 0
}

variable "timeout" {
  description = "Job timeout in minutes"
  type        = number
  default     = 60
}

variable "worker_type" {
  description = "Worker type (e.g. G.1X, G.2X, G.025X)"
  type        = string
  default     = "G.1X"
}

variable "number_of_workers" {
  description = "Number of workers of the specified worker_type"
  type        = number
  default     = 2
}

variable "default_arguments" {
  description = "Default arguments passed to the job"
  type        = map(string)
  default     = {}
}

variable "connections" {
  description = "List of Glue connection names to associate with this job"
  type        = list(string)
  default     = []
}

variable "security_configuration" {
  description = "Name of an existing Glue Security Configuration to use (for encryption)"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to apply to the Glue job"
  type        = map(string)
  default     = {}
}
