module "ec2" {                                                      # EC2 module block

  source = "./modules/ec2"                                          # EC2 module path

  instance_type = var.instance_type                                 # Pass EC2 type to module

  count = var.stage == "ec2" || var.stage == "all" ? 1 : 0         # Create EC2 conditionally
}

module "s3" {                                                       # S3 module block

  source = "./modules/s3"                                           # S3 module path

  bucket_name = var.bucket_name                                     # Pass bucket name to module

  count = var.stage == "s3" || var.stage == "all" ? 1 : 0          # Create S3 conditionally
}