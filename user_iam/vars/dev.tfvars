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

 ec2_test = {
    purpose              = "ec2-test"
    assume_role_services = ["ec2.amazonaws.com"]
    attach_basic_policy  = false
    attach_xray_policy   = false

    inline_policies = [
      {
        name   = "tomss-ec2-inline-policy"
        policy = jsonencode({
          Version = "2012-10-17",
          Statement = [
            {
              Effect = "Allow",
              Action = ["apigateway:GET"],
              Resource = "*"
            },
            {
              Effect = "Allow",
              Action = ["lambda:InvokeFunction"],
              Resource = "*"
            },
            {
              Effect = "Allow",
              Action = ["route53:GetHostedZone"],
              Resource = "*"
            }
          ]
        })
      }
    ]

    managed_policy_arns = []
  }
}

