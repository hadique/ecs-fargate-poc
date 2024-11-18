# configure aws provider
provider "aws" {
  region = var.region

  default_tags {
    tags = {
      env = "fargate"
      service = "blurryface"
    }
  }
}
