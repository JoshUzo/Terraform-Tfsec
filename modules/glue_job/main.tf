resource "aws_glue_job" "this" {
  name     = local.glue_job_name
  role_arn = var.role_arn

  glue_version = var.glue_version

  command {
    name            = "glueetl"
    script_location = var.script_location
    python_version  = "3" # adjust if needed for your Glue version
  }

  max_retries = var.max_retries
  timeout     = var.timeout

  worker_type       = var.worker_type
  number_of_workers = var.number_of_workers

  # Simple connections argument, since we already have a list
  connections = length(var.connections) > 0 ? var.connections : null

  security_configuration = var.security_configuration

  default_arguments = var.default_arguments