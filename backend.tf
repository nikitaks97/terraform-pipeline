terraform {
  backend "s3" {
    bucket         = "statebucket-0"
    key            = "statebucket-0/s3-tf-new"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"  # Uncomment and specify DynamoDB table name for state locking
  }
}
