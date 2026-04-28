terraform {
  backend "s3" {
    bucket         = "terraform-state-s3-bishal-bucket"   # S3 bucket to store state file
    key            = "terraform-project/terraform.tfstate" # Path inside bucket
    region         = "ap-south-1"                 # AWS region (Mumbai)
    dynamodb_table = "terraform-lock-table-bishal"       # Table for state locking
  }
}