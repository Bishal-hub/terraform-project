provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "myserver" {
  ami           = "ami-0f58b397bc5c1f2e8"
  instance_type = var.instance_type # Changed from hardcoded to variable

  tags = {
    Name = "terraform-ec2-bishal"
  }
}