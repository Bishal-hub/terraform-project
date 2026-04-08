variable "aws_region" {
  description = "AWS region"     # Description of variable
  type        = string           # Type of variable
  default     = "ap-south-1"     # Default region
}

variable "stage" {
  description = "Select infra to create"   # Used to choose resource
  type        = string                     # String type

  validation {
    condition     = contains(["ec2", "s3", "all"], var.stage)  # Allowed values
    error_message = "stage must be ec2, s3 or all"            # Error if invalid input
  }
}

variable "instance_type" {
  description = "EC2 instance type"   # EC2 size
  type        = string                # Type string
  default     = "t3.micro"            # Default instance
}

variable "ami_id" {
  description = "AMI ID"              # EC2 image
  type        = string                # Type string
  default     = "ami-0f58b397bc5c1f2e8"  # Default AMI
}

variable "bucket_name" {
  description = "S3 bucket name"      # Bucket name
  type        = string                # Type string
  default     = "bishal-demo-bucket-2026-001"  # Must be globally unique
}