resource "aws_instance" "myserver" {
  count = local.create_ec2 ? 1 : 0   # Create EC2 only if condition is true

  ami           = var.ami_id         # AMI ID from variable
  instance_type = var.instance_type  # Instance type

  tags = {
    Name = "terraform-ec2"           # Tag for EC2 instance
  }
}