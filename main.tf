provider "aws" {
  region = "ap-south-1"
}

# 🔹 Ubuntu AMI
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

# 🔹 Amazon Linux AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# 🔸 Ubuntu Instances (3)
resource "aws_instance" "ubuntu_ec2" {
  count         = 3
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name = "jyoti-${count.index + 1}"
  }
}

# 🔸 Amazon Linux Instances (3)
resource "aws_instance" "amazon_ec2" {
  count         = 3
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"

  tags = {
    Name = "raman-${count.index + 1}"
  }
}