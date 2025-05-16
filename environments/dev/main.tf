provider "aws" {
  region = "us-east-2"
}

resource "null_resource" "test" {
  provisioner "local-exec" {
    command = "echo 'Testing remote backend...'"
  }
}
