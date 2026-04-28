output "ec2_public_ip" {
  value = try(module.ec2[0].public_ip, "EC2 not created")   # Getting output from EC2 module
}

output "s3_bucket_id" {
  value = try(module.s3[0].bucket_id, "S3 not created")    # Getting output from S3 module
}