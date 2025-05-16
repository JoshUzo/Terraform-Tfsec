variable "bucket_name" {
    description = "s3 bucket name"
    type = string
  
}

variable "enable_versioning" {
    description = "enabling versioning"
    type = bool
}

variable "sse_algorithm" {
    description = "encrypt s3 data"
    type = string

}

variable "tags" {
    description = "maps of tags"
    type        = map(string)
    default     = {}
}
