resource "aws_elasticache_subnet_group" "this" {
  name = "${var.project_name}-${var.environment}-redis-subnet-group"

  subnet_ids = var.database_subnet_ids

  tags = {
    Name        = "${var.project_name}-${var.environment}-redis-subnet-group"
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
  }
}

resource "aws_elasticache_replication_group" "this" {
  replication_group_id = "${var.project_name}-${var.environment}-redis"

  description = "Redis cluster for ${var.project_name}-${var.environment}"

  node_type = "cache.t3.micro"

  engine = "redis"

  engine_version = "7.1"

  num_cache_clusters = 1

  parameter_group_name = "default.redis7"

  subnet_group_name = aws_elasticache_subnet_group.this.name

  security_group_ids = [
    var.redis_security_group_id
  ]

  at_rest_encryption_enabled = true

  transit_encryption_enabled = true

  automatic_failover_enabled = false

  snapshot_retention_limit = 7

  tags = {
    Name        = "${var.project_name}-${var.environment}-redis"
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
  }
}