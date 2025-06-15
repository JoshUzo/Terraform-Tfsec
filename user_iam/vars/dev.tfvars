organization = "htown"
team         = "sp"
env          = "dev"
aws_region   = "us-east-2"

iam_roles = {
  etl = {
    purpose              = "etl"
    assume_role_services = ["lambda.amazonaws.com"]
    attach_basic_policy  = false
    attach_xray_policy   = false
    inline_policies      = []
    managed_policy_arns  = []
  }

  audit = {
    purpose              = "audit"
    assume_role_services = ["lambda.amazonaws.com"]
    attach_basic_policy  = false
    attach_xray_policy   = false
    inline_policies      = []
    managed_policy_arns  = []
  }

security = {
    purpose              = "security"
    assume_role_services = ["lambda.amazonaws.com"]
    attach_basic_policy  = false
    attach_xray_policy   = false
    inline_policies      = []
    managed_policy_arns  = []
  }


}