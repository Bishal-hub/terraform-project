terraform {
  backend "s3" {
    bucket         = "terraform-state-s3-bishal-bucket"   # S3 bucket where state file will be stored
    key            = "terraform-project/terraform.tfstate" # Path (key) inside S3 bucket
    region         = "ap-south-1"                         # AWS region of S3 bucket
    dynamodb_table = "terraform-lock-table-bishal"        # DynamoDB table for state locking
    encrypt        = true                                 # Encrypt state file
  }
}