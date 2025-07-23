output "instance_ids" {
  description = "IDs of EC2 instances"
  value       = { for name, inst in aws_instance.this : name => inst.id }
}

output "public_ips" {
  description = "Public IPs of EC2 instances"
  value       = { for name, inst in aws_instance.this : name => inst.public_ip }
}

output "private_ips" {
  description = "Private IPs of EC2 instances"
  value       = { for name, inst in aws_instance.this : name => inst.private_ip }
}
