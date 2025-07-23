organization  = "htown"
team          = "sp"
resource_type = "vpce"
purpose       = "Rockets"
env           = "dev"
aws_region    = "us-east-2"

vpc_id = "vpc-0ffffc9c207e79680"

subnet_ids = [
  "subnet-05ad525a23a0ad948",
  "subnet-0f42138520719fb37"
]

security_group_ids = [
  "sg-049f6e6905ced1528"
]

endpoint_type = "Gateway"

service_name = "com.amazonaws.us-east-2.s3"

private_dns_enabled = true

policy_document = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "*",
      "Resource": "*"
    }
  ]
}
EOF



