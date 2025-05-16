terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

#provider "aws" {
#  region = "us-east-2"
#}

resource "aws_s3_bucket" "insecure_bucket" {
  bucket = "my-insecure-bucket-dev"
}

resource "aws_s3_bucket_acl" "this" {
  bucket = aws_s3_bucket.insecure_bucket.id
  acl    = "public-read"
}

