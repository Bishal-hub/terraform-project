output "ubuntu_ips" {
  value = aws_instance.ubuntu_ec2[*].public_ip
}

output "amazon_ips" {
  value = aws_instance.amazon_ec2[*].public_ip
}