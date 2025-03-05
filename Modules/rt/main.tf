# Public route table for internet access
resource "aws_route_table" "aws-rtb-public" {
  vpc_id = var.aws-vpc-free-tier_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.aws-igw-free-tier_id
  }
  tags = {
    Name = "dev-rtb-public"
  }
}

# two local route table for access within vpc to attach to private subnet
resource "aws_route_table" "aws-rtb-private-us-east-1a" {
  vpc_id = var.aws-vpc-free-tier_id

  tags = {
    Name = "dev-rtb-private-us-east-1a"
  }
}
resource "aws_route_table" "aws-rtb-private-us-east-1b" {
  vpc_id = var.aws-vpc-free-tier_id

  tags = {
    Name = "dev-rtb-private-us-east-1b"
  }
}

# Route table-subnet associations
resource "aws_route_table_association" "a1-aws-rtb-public" {
  subnet_id      = var.aws-subnet-public-us-east-1a_id
  route_table_id = aws_route_table.aws-rtb-public.id
}
resource "aws_route_table_association" "a2-aws-rtb-public" {
  subnet_id      = var.aws-subnet-public-us-east-1b_id
  route_table_id = aws_route_table.aws-rtb-public.id
}
resource "aws_route_table_association" "aws-rtb-private-us-east-1a" {
  subnet_id      = var.aws-subnet-private-us-east-1a_id
  route_table_id = aws_route_table.aws-rtb-private-us-east-1a.id
}
resource "aws_route_table_association" "aws-rtb-private-us-east-1b" {
  subnet_id      = var.aws-subnet-private-us-east-1b_id
  route_table_id = aws_route_table.aws-rtb-private-us-east-1b.id
}