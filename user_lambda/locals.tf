locals {
  lambda_configs = {
    for k, v in var.lambda_functions : k => merge(
      v,
      lookup(var.source_code_hashes, k, { source_code_hash = "" })
    )
  }
}
