terraform {
  backend "s3" {
    bucket         = "statefile-0"
    key            = "statefile-0/s3-tf-new"
    region         = "us-east-1"
    # dynamodb_table = "terraform-locks"   # Optional for state locking
    encrypt        = true
  }
}
