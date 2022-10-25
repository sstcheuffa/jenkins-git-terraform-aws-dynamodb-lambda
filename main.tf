terraform {
  backend "s3" {
    bucket         = "terraform-aws-jenkins-git-lambda-dynamodb-s3-state-backend"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform_state"
  }

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = var.aws_region
}