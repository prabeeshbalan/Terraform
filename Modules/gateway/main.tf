# Internet gateway for internet access from public subnet
resource "aws_internet_gateway" "aws-igw-free-tier" {
  vpc_id = var.aws-vpc-free-tier_id

  tags = {
    Name = "dev-igw-free-tier"
  }
}