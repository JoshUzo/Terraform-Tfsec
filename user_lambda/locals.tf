locals {
  lambda_configs = {
    for name, cfg in var.lambda_functions :
    name => merge(
      cfg,
      contains(keys(var.source_code_hashes), name)
        && try(var.source_code_hashes[name].source_code_hash, null) != null
        ? { source_code_hash = var.source_code_hashes[name].source_code_hash }
        : {}
    )
  }
}

