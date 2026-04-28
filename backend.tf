terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"   # S3 bucket to store state file
    key            = "terraform-project/terraform.tfstate" # Path inside bucket
    region         = "ap-south-1"                 # AWS region (Mumbai)
    dynamodb_table = "terraform-lock-table"       # Table for state locking
  }
}