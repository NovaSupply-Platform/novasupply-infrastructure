output "redis_primary_endpoint" {
  value = aws_elasticache_replication_group.this.primary_endpoint_address
}

output "redis_replication_group_id" {
  value = aws_elasticache_replication_group.this.id
}