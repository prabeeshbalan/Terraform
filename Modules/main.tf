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

module "aws-vpc-free-tier" {
  source = "./vpc"
}

module "aws-igw-free-tier" {
  source               = "./gateway"
  aws-vpc-free-tier_id = module.aws-vpc-free-tier.aws-vpc-free-tier_id
}

module "aws-nacl-free-tier" {
  source                           = "./nacl"
  aws-vpc-free-tier_id             = module.aws-vpc-free-tier.aws-vpc-free-tier_id
  aws-subnet-public-us-east-1a_id  = module.aws-subnet-free-tier.aws-subnet-public-us-east-1a_id
  aws-subnet-public-us-east-1b_id  = module.aws-subnet-free-tier.aws-subnet-public-us-east-1b_id
  aws-subnet-private-us-east-1a_id = module.aws-subnet-free-tier.aws-subnet-private-us-east-1a_id
  aws-subnet-private-us-east-1b_id = module.aws-subnet-free-tier.aws-subnet-private-us-east-1b_id
}

module "aws-subnet-free-tier" {
  source               = "./subnet"
  aws-vpc-free-tier_id = module.aws-vpc-free-tier.aws-vpc-free-tier_id
}

module "aws-rtb-free-tier" {
  source                           = "./rt"
  aws-vpc-free-tier_id             = module.aws-vpc-free-tier.aws-vpc-free-tier_id
  aws-subnet-public-us-east-1a_id  = module.aws-subnet-free-tier.aws-subnet-public-us-east-1a_id
  aws-subnet-public-us-east-1b_id  = module.aws-subnet-free-tier.aws-subnet-public-us-east-1b_id
  aws-subnet-private-us-east-1a_id = module.aws-subnet-free-tier.aws-subnet-private-us-east-1a_id
  aws-subnet-private-us-east-1b_id = module.aws-subnet-free-tier.aws-subnet-private-us-east-1b_id
  aws-igw-free-tier_id             = module.aws-igw-free-tier.aws-igw-free-tier_id
}

module "aws-sg-free-tier" {
  source               = "./sg"
  aws-vpc-free-tier_id = module.aws-vpc-free-tier.aws-vpc-free-tier_id
}

module "aws-ec2-free-tier" {
  source                          = "./ec2"
  aws-public-sg_id                = module.aws-sg-free-tier.aws-public-sg_id
  aws-subnet-public-us-east-1a_id = module.aws-subnet-free-tier.aws-subnet-public-us-east-1a_id
}