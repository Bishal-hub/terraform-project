locals {
  create_ec2 = var.stage == "ec2" || var.stage == "all"   # True if EC2 needs to be created
  create_s3  = var.stage == "s3" || var.stage == "all"    # True if S3 needs to be created
}