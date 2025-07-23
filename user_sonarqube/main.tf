module "sonarqube_ec2" {
  source = "../modules/ec2"

  key_name  = var.key_name
  instances = var.instances

  organization   = var.organization
  team           = var.team
  aws_region     = var.aws_region
  resource_type  = var.resource_type
  purpose        = var.purpose
  env            = var.env

}
  

