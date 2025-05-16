# Terraform Bootstrap – Remote State Backend Setup

This directory provisions the required backend infrastructure for storing Terraform state remotely.

## Resources Created

- S3 bucket: `devops-tf-state-Htown`
- DynamoDB table: `terraform-locks`
- S3 bucket has:
  - Versioning enabled
  - AES256 server-side encryption
  - Public access blocked

## Usage

Run this once before using remote state in any environment:

```bash
cd bootstrap/
terraform init
terraform apply
