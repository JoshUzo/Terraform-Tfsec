locals {
  common_tags = {
    Organization = var.organization
    Team         = var.team
    Environment  = var.env
    Component    = "glue-job"
  }

  merged_glue_jobs = merge(var.glue_jobs, var.glue_jobs_autogen)
}
