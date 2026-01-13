organization = "htown"
team         = "sp"
env          = "dev"
aws_region   = "us-east-2"

lambda_artifact_bucket = "htown-dev-lambda-artifacts"  # S3 bucket where CI/CD stores Lambda & layer zips


layers_to_publish = {
  my_big_layer = {
    s3_key              = "layers/digest_index.zip"
    compatible_runtimes = ["python3.12", "nodejs18.x"]
    description         = "Shared dependencies"
  }
}


