resource "aws_instance" "aws-public-ec2-free-tier" {

  ami                         = "ami-0453ec754f44f9a4a"
  instance_type               = "t2.micro"
  subnet_id                   = var.aws-subnet-public-us-east-1a_id
  vpc_security_group_ids      = [var.aws-public-sg_id]
  associate_public_ip_address = true

  key_name = "aws_tf_key"

  tags = {
    Name = "dev-public-ec2-free-tier"
  }

}

resource "aws_key_pair" "aws_tf_key" {

  key_name   = "aws_tf_key"
  public_key = tls_private_key.rsa.public_key_openssh

}

resource "tls_private_key" "rsa" {

  algorithm = "RSA"
  rsa_bits  = 4096

}

resource "local_file" "aws_tf_key" {

  content  = tls_private_key.rsa.private_key_pem
  filename = "aws_tf_key.pem"

}

output "instance_public_ip" {

  value = aws_instance.aws-public-ec2-free-tier.public_ip

}