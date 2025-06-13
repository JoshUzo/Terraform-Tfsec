terraform {
  backend "s3" {
    bucket         = "devops-tf-state-htown"
    key            = "dev/user_lambda/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
  }
}