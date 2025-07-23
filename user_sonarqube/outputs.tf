output "instance_ids" {
  value = module.sonarqube_ec2.instance_ids
}

output "public_ips" {
  value = module.sonarqube_ec2.public_ips
}

output "private_ips" {
  value = module.sonarqube_ec2.private_ips
}
