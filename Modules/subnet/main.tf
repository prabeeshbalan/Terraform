
# two public subents
resource "aws_subnet" "aws-subnet-public-us-east-1a" {
  vpc_id     = var.aws-vpc-free-tier_id
  cidr_block = "10.0.1.0/24"

  availability_zone = "us-east-1a"

  tags = {
    Name = "dev-subnet-public-us-east-1a"
  }
}

resource "aws_subnet" "aws-subnet-public-us-east-1b" {
  vpc_id     = var.aws-vpc-free-tier_id
  cidr_block = "10.0.2.0/24"

  availability_zone = "us-east-1b"

  tags = {
    Name = "dev-subnet-public-us-east-1b"
  }
}

# two private subents
resource "aws_subnet" "aws-subnet-private-us-east-1a" {
  vpc_id     = var.aws-vpc-free-tier_id
  cidr_block = "10.0.3.0/24"

  availability_zone = "us-east-1a"

  tags = {
    Name = "dev-subnet-private-us-east-1a"
  }
}

resource "aws_subnet" "aws-subnet-private-us-east-1b" {
  vpc_id     = var.aws-vpc-free-tier_id
  cidr_block = "10.0.4.0/24"

  availability_zone = "us-east-1b"

  tags = {
    Name = "dev-subnet-private-us-east-1b"
  }
}