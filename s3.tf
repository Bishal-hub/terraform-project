resource "aws_s3_bucket" "mybucket" {
  count = local.create_s3 ? 1 : 0   # Create bucket only if condition is true

  bucket        = var.bucket_name   # Bucket name from variable
  force_destroy = true              # Allow deleting non-empty bucket

  tags = {
    Name = "terraform-s3"           # Tag name
  }
}