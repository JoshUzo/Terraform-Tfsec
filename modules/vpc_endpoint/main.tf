resource "aws_vpc_endpoint" "this" {
  vpc_id            = var.vpc_id
  service_name      = var.service_name
  vpc_endpoint_type = var.endpoint_type

  # Only for interface endpoints
  subnet_ids         = var.endpoint_type == "Interface" ? var.subnet_ids : null
  security_group_ids = var.endpoint_type == "Interface" && length(var.security_group_ids) > 0 ? var.security_group_ids : null
  private_dns_enabled = var.endpoint_type == "Interface" ? var.private_dns_enabled : null

  # Only for gateway endpoints
  route_table_ids = var.endpoint_type == "Gateway" ? var.route_table_ids : null

  # Policy document, if provided
  policy = var.policy_document

  tags = local.all_tags
}
