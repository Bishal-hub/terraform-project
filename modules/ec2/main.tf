resource "aws_instance" "this" {
  ami           = var.ami            # AMI ID
  instance_type = var.instance_type  # Instance type
  key_name      = var.key_name       # SSH key

  tags = {
    Name = var.name                 # Tag for EC2
  }
}