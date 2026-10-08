output "inventory_repository_url" {
  value = aws_ecr_repository.inventory_service.repository_url
}

output "order_repository_url" {
  value = aws_ecr_repository.order_service.repository_url
}

output "shipping_repository_url" {
  value = aws_ecr_repository.shipping_service.repository_url
}