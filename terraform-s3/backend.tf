terraform {
  backend "s3" {
    bucket         = "terraform-state-s3-bishal-bucket"
    key            = "s3/terraform.tfstate"   # IMPORTANT (separate state) same backend (bucket+dynamodb) but different statefile keys for avoid over lapping
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "terraform-lock-table-bishal"
  }
}