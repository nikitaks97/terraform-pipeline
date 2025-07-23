output "lock_table_name" {
  description = "The name of the DynamoDB lock table"
  value       = aws_dynamodb_table.lock_table.name
}
output "lock_table_arn" {
  description = "The ARN of the DynamoDB lock table"
  value       = aws_dynamodb_table.lock_table.arn
}