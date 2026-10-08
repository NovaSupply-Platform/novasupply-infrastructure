resource "aws_db_subnet_group" "this" {
  name = "${var.project_name}-${var.environment}-db-subnet-group"

  subnet_ids = var.database_subnet_ids

  tags = {
    Name        = "${var.project_name}-${var.environment}-db-subnet-group"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "aws_db_instance" "this" {
  identifier = "${var.project_name}-${var.environment}-postgres"

  engine         = "postgres"
  engine_version = "16.3"

  instance_class = "db.t3.micro"

  allocated_storage = 20
  storage_encrypted = true

  username                    = "postgres"
  manage_master_user_password = true

  db_subnet_group_name = aws_db_subnet_group.this.name

  vpc_security_group_ids = [
    var.rds_security_group_id
  ]

  publicly_accessible = false

  backup_retention_period = 7

  deletion_protection = true

  skip_final_snapshot = true

  tags = {
    Name        = "${var.project_name}-${var.environment}-postgres"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}