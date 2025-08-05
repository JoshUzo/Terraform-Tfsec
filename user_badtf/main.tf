resource "aws_security_group" "bad_sg" {
  name        = "insecure_sg"
  description = "Allows everything inbound"
  vpc_id      = "vpc-12345678"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # KICS will flag this
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_s3_bucket" "insecure_bucket" {
  bucket = "insecure-terraform-bucket"

  acl    = "public-read"  # KICS will flag this as HIGH
}

resource "aws_iam_policy" "overly_permissive" {
  name = "bad_policy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "*",                # Wildcard action
        Effect = "Allow",
        Resource = "*",              # Wildcard resource
      }
    ]
  })
}
