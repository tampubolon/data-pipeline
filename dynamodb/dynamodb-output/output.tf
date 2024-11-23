output "dynamodb_table_name" {
  description = "The name of the DynamoDB table"
  value       = aws_dynamodb_table.dynamodb_output.name
}

output "dynamodb_table_arn" {
  description = "The ARN of the DynamoDB table"
  value       = aws_dynamodb_table.dynamodb_output.arn
}

output "dynamodb_table_stream_arn" {
  description = "The stream ARN of the DynamoDB table (if streams are enabled)"
  value       = aws_dynamodb_table.dynamodb_output.stream_arn
  sensitive   = false
}