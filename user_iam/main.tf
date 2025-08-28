module "iam_roles" {
  source = "../modules/IAM"

  for_each = var.iam_roles

  purpose       = each.value.purpose
  organization  = var.organization
  aws_region    = var.aws_region
  team          = var.team
  env           = var.env

  #role_name              = ""  # optional override for role names2
  assume_role_services = each.value.assume_role_services
  attach_basic_policy  = each.value.attach_basic_policy
  attach_xray_policy   = each.value.attach_xray_policy
  inline_policies      = each.value.inline_policies
  managed_policy_arns  = each.value.managed_policy_arns
}