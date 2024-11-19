terraform {
  backend "s3" {
    bucket         = "sampleapp-fargate2"
    key            = "sample-app/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "lock_table"
    encrypt        = true
  }
}
