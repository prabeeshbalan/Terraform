terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  backend "local" {
    path = "state/terraform.tfstate"
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}


module "dev-aws-s3-bucket" {
  source = "./s3bucket"
}