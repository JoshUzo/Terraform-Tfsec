locals {
  merged_lambda_functions = merge(
    var.lambda_functions,
    { for k, v in var.lambda_functions : k => merge(v, lookup(var.source_code_hashes, k, {})) }
  )
}
