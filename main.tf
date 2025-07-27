provider "aws" {
  region = "ap-south-1"
}

resource "aws_key_pair" "xops_key" {
  key_name   = "xops_mumbai_key"
  public_key = file("C:/Users/Roshini/.ssh/xops_key.pub")
}

resource "aws_security_group" "xops_sg" {
  name        = "xops_sg"
  description = "Allow SSH and HTTP"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
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

resource "aws_instance" "web" {
  ami           = "ami-03bb6d83c60fc5f7c" # Amazon Linux 2 AMI (as of ap-south-1)
  instance_type = "t2.micro"
  key_name      = aws_key_pair.xops_key.key_name
  vpc_security_group_ids = [aws_security_group.xops_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install python3 -y
              EOF

  tags = {
    Name = "xops-webserver"
  }
}
