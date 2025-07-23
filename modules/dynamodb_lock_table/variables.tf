variable "table_name" {
  description = "The name of the DynamoDB table"
  type        = string
  default     = "terraform-locks"
}

variable "billing_mode" {
  description = "DynamoDB billing mode"
  type        = string
  default     = "PAY_PER_REQUEST"
}

variable "hash_key" {
  description = "The name of the hash key for the table"
  type        = string
  default     = "LockID"
}

variable "tags" {
  description = "Tags to apply to the DynamoDB table"
  type        = map(string)
  default     = {
    Name        = "Terraform State Lock Table"
    Environment = "Dev"
  }
}
variable "dynamodb_table_name" {
  description = "Name of the DynamoDB table for state locking"
  type        = string
  default     = "terraform-state-lock"
}       