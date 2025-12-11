module "glue_jobs" {
  source = "../modules/glue_job"

  for_each = local.merged_glue_jobs

  organization = var.organization
  team         = var.team
  env          = var.env

  name            = each.key
  role_arn        = each.value.role_arn
  script_location = each.value.script_location

  glue_version      = try(each.value.glue_version, "4.0")
  max_retries       = try(each.value.max_retries, 0)
  timeout           = try(each.value.timeout, 60)
  worker_type       = try(each.value.worker_type, "G.1X")
  number_of_workers = try(each.value.number_of_workers, 2)

  default_arguments      = try(each.value.default_arguments, {})
  connections            = try(each.value.connections, [])
  security_configuration = try(each.value.security_configuration, null)

}
