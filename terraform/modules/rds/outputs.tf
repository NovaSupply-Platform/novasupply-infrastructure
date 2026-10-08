output "db_endpoint" {
  value = aws_db_instance.this.endpoint
}

output "db_identifier" {
  value = aws_db_instance.this.id
}

output "master_user_secret_arn" {
  description = "ARN of the Secrets Manager secret containing RDS master credentials"
  value       = try(aws_db_instance.this.master_user_secret[0].secret_arn, null)
}