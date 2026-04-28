resource "aws_s3_bucket" "mys3" {                                   # S3 bucket resource

  bucket = var.bucket_name                                          # Bucket name from variable

  tags = {                                                          # Resource tags

    Name = "bishal-s3"                                              # S3 bucket tag
  }
}