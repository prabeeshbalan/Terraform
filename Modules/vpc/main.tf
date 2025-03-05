# vpc 
resource "aws_vpc" "aws-vpc-free-tier" {

  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "dev-vpc-free-tier"
  }

  enable_dns_support   = true
  enable_dns_hostnames = true

}