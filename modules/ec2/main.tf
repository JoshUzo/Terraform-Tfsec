resource "aws_instance" "this" {
  for_each = var.instances

  ami                         = each.value.ami_id
  instance_type               = each.value.instance_type
  subnet_id                   = each.value.subnet_id
  vpc_security_group_ids      = each.value.security_group_ids
  user_data                   = each.value.user_data
  key_name                    = var.key_name


  tags = local.all_tags
    
}
