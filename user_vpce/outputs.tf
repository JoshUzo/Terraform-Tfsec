output "vpc_endpoint_id" {
  description = "ID of the created VPC endpoint"
  value       = module.vpc_endpoint.vpc_endpoint_id
}

output "dns_entries" {
  description = "DNS names associated with the VPC endpoint"
  value       = module.vpc_endpoint.dns_entry
}

output "network_interface_ids" {
  description = "IDs of network interfaces created by the VPC endpoint"
  value       = module.vpc_endpoint.network_interface_ids
}
