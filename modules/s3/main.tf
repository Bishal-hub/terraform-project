resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name   # Bucket name

  tags = {
    Name = var.bucket_name   # Tag
  }
}