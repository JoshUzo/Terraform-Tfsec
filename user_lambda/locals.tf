locals {
  lambda_configs = {
    for k, v in var.lambda_functions : k => merge(
      v,
      {
        source_code_hash = lookup(var.source_code_hashes, "lambda_functions.${k}.source_code_hash", null)
      }
    )
  }
}
