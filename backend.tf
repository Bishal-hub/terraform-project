terraform {
  backend "s3" {
    bucket         = "terraform-state-s3-bishal-bucket"
    key            = "terraform-project/terraform.tfstate"   # changed from eks → your project
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "terraform-lock-table-bishal"
  }
}