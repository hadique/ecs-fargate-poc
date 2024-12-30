terraform {
  backend "s3" {
    bucket         = "ecs-fargate-state"
    key            = "sample-app/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "ecs-database-lock"
    encrypt        = true
  }
}
