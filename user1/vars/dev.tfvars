organization = "htown"
team = "sp"
env = "dev"
aws_region  = "us-east-2"
enable_versioning = true
sse_algorithm = "AES256"

s3_buckets = {
  brown = { purpose = "brown" }
  blue  = { purpose = "blue"  }
  logs  = { purpose = "logs"  }
  data  = { purpose = "data"  }
  food  = { purpose = "food"  }
}

