# Create network acl
resource "aws_network_acl" "aws-nacl-free-tier" {
  vpc_id = var.aws-vpc-free-tier_id

  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "dev-nacl-free-tier"
  }
}

# nacl-subnet association
resource "aws_network_acl_association" "a1-nacl-subnet" {
  network_acl_id = aws_network_acl.aws-nacl-free-tier.id
  subnet_id      = var.aws-subnet-public-us-east-1a_id
}
resource "aws_network_acl_association" "a2-nacl-subnet" {
  network_acl_id = aws_network_acl.aws-nacl-free-tier.id
  subnet_id      = var.aws-subnet-public-us-east-1b_id
}
resource "aws_network_acl_association" "a3-nacl-subnet" {
  network_acl_id = aws_network_acl.aws-nacl-free-tier.id
  subnet_id      = var.aws-subnet-private-us-east-1a_id
}
resource "aws_network_acl_association" "a4-nacl-subnet" {
  network_acl_id = aws_network_acl.aws-nacl-free-tier.id
  subnet_id      = var.aws-subnet-private-us-east-1b_id
}