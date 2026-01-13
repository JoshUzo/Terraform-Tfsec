variable "lambda_artifact_bucket" {
  type        = string
  description = "S3 bucket where Lambda and Layer ZIPs are stored"
}

variable "layers_to_publish" {
  type = map(object({
    s3_key              = string
    compatible_runtimes = list(string)
    description         = optional(string, "")
  }))
  default = {}
}

resource "aws_lambda_layer_version" "published" {
  for_each = var.layers_to_publish

  layer_name          = each.key
  s3_bucket           = var.lambda_artifact_bucket
  s3_key              = each.value.s3_key
  compatible_runtimes = each.value.compatible_runtimes
  description         = try(each.value.description, "")
}

output "layer_version_arns" {
  value = { for k, v in aws_lambda_layer_version.published : k => v.arn }
}
