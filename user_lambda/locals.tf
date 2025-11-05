locals {
  # 1) Keep manual entries (from dev.tfvars) if you still want them
  # 2) Overlay auto-discovered entries from CI (these win)
  merged_base = merge(var.lambda_functions, var.lambda_functions_autogen)

  # 3) Apply source_code_hash per-function only when present
  lambda_configs = {
    for name, cfg in local.merged_base :
    name => merge(
      cfg,
      contains(keys(var.source_code_hashes), name)
      && try(var.source_code_hashes[name].source_code_hash, null) != null
        ? { source_code_hash = var.source_code_hashes[name].source_code_hash }
        : {}
    )
  }
}

