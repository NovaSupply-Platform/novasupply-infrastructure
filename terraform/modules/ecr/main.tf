resource "aws_ecr_repository" "inventory_service" {
  name                 = "${var.project_name}-${var.environment}-inventory-service"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-inventory-service"
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
  }
}

resource "aws_ecr_repository" "order_service" {
  name                 = "${var.project_name}-${var.environment}-order-service"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-order-service"
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
  }
}

resource "aws_ecr_repository" "shipping_service" {
  name                 = "${var.project_name}-${var.environment}-shipping-service"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-shipping-service"
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
  }
}