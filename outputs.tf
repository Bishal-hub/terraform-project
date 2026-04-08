output "ec2_public_ip" {
  value = try(aws_instance.myserver[0].public_ip, "EC2 not created")  # Safe output
}

output "s3_bucket_name" {
  value = try(aws_s3_bucket.mybucket[0].bucket, "S3 not created")    # Safe output
}