output "public_ip" {
  value = aws_instance.this.public_ip   # EC2 public IP
}