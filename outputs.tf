output "ec2_public_ip" {                                            # EC2 public IP output

  value = try(module.ec2[0].public_ip, "EC2 not created")           # Safe EC2 output
}

output "s3_bucket_name" {                                           # S3 bucket output

  value = try(module.s3[0].bucket_name, "S3 not created")           # Safe S3 output
}