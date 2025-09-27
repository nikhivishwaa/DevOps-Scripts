provider "aws" {
  region = "ap-south-1" # mumbai
}

data "aws_vpc" "default" {
  default = true
}
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}
data "aws_subnet" "default" {
  id = data.aws_subnets.default.ids[0]
}


resource "aws_key_pair" "terraform_keypair" {
  key_name   = "my-terraform-key"
  public_key = file("~/.ssh/id_rsa_terraform.pub")
}

resource "aws_security_group" "web_app_sg" {
  name        = "webapp-sg"
  description = "Web Application Security Group"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "MyTerraformServer"
  }
}

resource "aws_instance" "myserver" {
  ami                    = "ami-02d26659fd82cf299" # ubuntu 24 LTS
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.terraform_keypair.key_name
  vpc_security_group_ids = [aws_security_group.web_app_sg.id]
  subnet_id              = data.aws_subnet.default.id
  user_data              = <<-EOF
                           #!/bin/bash
                           sudo apt update -y
                           sudo apt install nginx -y
                           sudo systemctl enable nginx
                           sudo ufw allow http
                           sudo systemctl restart nginx
                           EOF

  tags = {
    Name = "MyTerraformServer"
  }
}
