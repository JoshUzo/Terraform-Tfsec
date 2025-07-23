module "vpc_endpoint" {
  source = "../modules/vpc_endpoint"

  vpc_id             = var.vpc_id
  subnet_ids         = var.subnet_ids
  security_group_ids = var.security_group_ids
  endpoint_type      = var.endpoint_type
  service_name       = var.service_name
  private_dns_enabled = var.private_dns_enabled
  policy_document    = var.policy_document
  organization   = var.organization
  team           = var.team
  aws_region     = var.aws_region
  resource_type  = var.resource_type
  purpose        = var.purpose
  env            = var.env
}
