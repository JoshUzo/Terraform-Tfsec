terraform {
  backend "s3" {
    bucket         = "devops-tf-state-htown"
    key            = "prod/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}