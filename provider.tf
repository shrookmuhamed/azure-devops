provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "terraform-day1-shrouk"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    # dynamodb_table = "state-lock"
  }
}