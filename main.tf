provider "aws" {
  region = var.region
}

# Upload SSH Key
resource "aws_key_pair" "test_key" {
  key_name   = "test_key_key"
  public_key = file(var.key_path)
}

# Security Group
resource "aws_security_group" "ssh_access" {
  name        = "ssh-access-tf"
  description = "Allow SSH & HTTP access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance
resource "aws_instance" "test_ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.test_key.id
  vpc_security_group_ids = [aws_security_group.ssh_access.id]

  tags = {
    Name        = var.instance_name
    Description = "Terraform practice on Ubuntu"
  }
}
