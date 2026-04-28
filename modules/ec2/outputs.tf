output "public_ip" {                                                # EC2 public IP output

  value = aws_instance.myec2.public_ip                              # Fetch EC2 public IP
}