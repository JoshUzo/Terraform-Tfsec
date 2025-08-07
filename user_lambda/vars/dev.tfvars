organization = "htown"
team         = "sp"
env          = "dev"
aws_region   = "us-east-2"

lambda_artifact_bucket = "htown-dev-lambda-artifacts"  # S3 bucket where CI/CD stores Lambda & layer zips

lambda_functions = {
  cleaner = {
    purpose      = "cleaning"
    handler      = "clean.handler"
    runtime      = "python3.9"
    role_arn     = "arn:aws:iam::211125625532:role/htown-sp-iam-etl-dev"

    environment_variables = {
      STAGE = "dev"
    }

    # S3-based deployment (CI/CD uploads this ZIP)
    s3_key            = "lambdas/cleaner.zip"
    source_code_hash  = "REPLACE BY CICD"


    # Optional Layer 
    create_layer      = true
    layer_s3_key      = "layers/data_cleaner.zip"
    layers            = []
    s3_event          = null

  }
 
   digest_index = {
    purpose      = "indexing"
    handler      = "index.handler"
    runtime      = "python3.9"
    role_arn     = "arn:aws:iam::211125625532:role/htown-sp-iam-etl-dev"

    environment_variables = {
      STAGE = "dev"
    }

    s3_key            = "lambdas/digest_index.zip"
    source_code_hash  = "REPLACE BY CICD"

    create_layer      = true
    layer_s3_key      = "layers/digest_index.zip"
    layers            = []
    s3_event          = null
  }
}



