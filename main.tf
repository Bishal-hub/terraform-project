module "ec2" {
  source = "./modules/ec2"      # Path to EC2 module

  count = var.stage == "ec2" || var.stage == "all" ? 4 : 0  # Create EC2 only if selected

  ami           = var.ami       # Passing AMI variable
  instance_type = var.instance_type  # Passing instance type
  key_name      = var.key_name  # Passing key name
  name          = "my-ec2"      # Tag name
}

module "s3" {
  source = "./modules/s3"       # Path to S3 module

  count = var.stage == "s3" || var.stage == "all" ? 1 : 0  # Create S3 only if selected

  bucket_name = var.bucket_name # Passing bucket name
}