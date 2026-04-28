terraform {                                                         # Terraform configuration block

  backend "s3" {                                                    # Store Terraform state in S3

    bucket         = "terraform-state-s3-bishal-bucket"             # S3 bucket name

    key            = "terraform-project/terraform.tfstate"          # State file path

    region         = "ap-south-1"                                   # AWS region

    dynamodb_table = "terraform-lock-table-bishal"                  # DynamoDB table for state locking
  }
}