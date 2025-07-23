output "vpc_endpoint_id" {
  description = "ID of the VPC endpoint"
  value       = aws_vpc_endpoint.this.id
}

output "dns_entry" {
  description = "DNS names associated with the endpoint (only for Interface endpoints)"
  value       = aws_vpc_endpoint.this.vpc_endpoint_type == "Interface" ? aws_vpc_endpoint.this.dns_entry : []
}

output "network_interface_ids" {
  description = "IDs of network interfaces created by the endpoint (only for Interface endpoints)"
  value       = aws_vpc_endpoint.this.vpc_endpoint_type == "Interface" ? aws_vpc_endpoint.this.network_interface_ids : []
}
