variable "project_name" {
  description = "Project Name"
  type        = string
}

variable "environment" {
  description = "Environment Name"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private Subnet IDs"
  type        = list(string)
}

variable "eks_cluster_role_arn" {
  description = "EKS Cluster IAM Role ARN"
  type        = string
}

variable "eks_node_role_arn" {
  description = "EKS Node IAM Role ARN"
  type        = string
}