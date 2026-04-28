output "bucket_name" {                                              # S3 bucket output

  value = aws_s3_bucket.mys3.bucket                                 # Fetch bucket name
}