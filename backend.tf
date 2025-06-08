terraform {
  required_version = ">= 1.0"
  backend "s3" {
    bucket         = "statefile-0"
    key            = "statefile-0/s3-tf-new"
    region         = "us-east-1"
    encrypt        = true
  #  dynamodb_table = "terraform-locks"   # For state locking
  }
}
