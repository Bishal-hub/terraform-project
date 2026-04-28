resource "aws_instance" "myec2" {                                   # EC2 resource

  ami = "ami-0f918f7e67a3323f0"                                     # Amazon Linux 2 AMI

  instance_type = var.instance_type                                 # EC2 instance type

  tags = {                                                          # Resource tags

    Name = "bishal-ec2"                                             # EC2 instance name
  }
}