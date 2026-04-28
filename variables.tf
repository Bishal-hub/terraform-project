variable "stage" {
  description = "Which resource to create (ec2, s3, all)"  # Controls module execution
}

variable "ami" {
  description = "AMI ID for EC2 instance"   # Explains purpose
}

variable "instance_type" {
  description = "Type of EC2 instance"     # Example: t2.micro
}

variable "key_name" {
  description = "SSH key name"             # Key pair for EC2 login
}

variable "bucket_name" {
  description = "S3 bucket name"           # Must be globally unique
}