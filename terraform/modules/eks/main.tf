resource "aws_eks_cluster" "this" {
  name     = "${var.project_name}-${var.environment}-eks"
  role_arn = var.eks_cluster_role_arn

  vpc_config {
    subnet_ids = var.private_subnet_ids
  }
}

resource "aws_eks_node_group" "this" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "${var.project_name}-${var.environment}-nodes"

  node_role_arn = var.eks_node_role_arn

  subnet_ids = var.private_subnet_ids

  scaling_config {
    desired_size = 1
    min_size     = 1
    max_size     = 2
  }

  instance_types = ["t3.medium"]

  depends_on = [
    aws_eks_cluster.this
  ]
}