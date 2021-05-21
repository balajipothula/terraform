terraform {

  required_providers {
  
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  
  }

}

provider "aws" {
  region  = "ap-south-1"
  profile = "nginxprofile"
}

variable "ami" {
  type        = string
  description = "AMI ID"
  default     = "ami-0860c9429baba6ad2"
}

variable "instance_type" {
  type        = string
  description = "Instance Type"
  default     = "t2.micro"
}

variable "availability_zone" {
  type        = string
  description = "Availability Zone"
  default     = "ap-south-1a"
}

variable "key_name" {
  type        = string
  description = "Instance Private Key"
  default     = "EC2"
}

resource "aws_instance" "nginx_server" {
  ami                    = var.ami               # Amazon Machine Image.
  count                  = 1                     # Number of instances.
  instance_type          = var.instance_type     # EC2 Instance Type.
  availability_zone      = var.availability_zone # Availability Zone Name.
  key_name               = var.key_name          # EC2 Instance Private Key.
  vpc_security_group_ids = ["sg-cc2fcdae"]       # Security Group ID.

  tags = {
    Name = "NGINX Server"
  }

  connection {
    user = "ubuntu"
    host = "${self.public_ip}"
    type = "ssh"
    private_key = "${file("/home/ubuntu/EC2.pem")}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt -y update",
      "sudo apt -y install nginx",
      "sudo service nginx start"
    ]
  }

}
