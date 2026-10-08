terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source = "../../modules/vpc"

  project_name = "novasupply"
  environment  = "dev"

  vpc_cidr = "10.0.0.0/16"

  availability_zones = [
    "ap-south-1a",
    "ap-south-1b",
    "ap-south-1c"
  ]

  public_subnets = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24"
  ]

  private_subnets = [
    "10.0.11.0/24",
    "10.0.12.0/24",
    "10.0.13.0/24"
  ]

  database_subnets = [
    "10.0.21.0/24",
    "10.0.22.0/24",
    "10.0.23.0/24"
  ]
}

module "security_groups" {
  source = "../../modules/security-groups"

  project_name = "novasupply"
  environment  = "dev"

  vpc_id = module.vpc.vpc_id
}

module "iam" {
  source = "../../modules/iam"

  project_name = "novasupply"
  environment  = "dev"
}

module "eks" {
  source = "../../modules/eks"

  project_name = "novasupply"
  environment  = "dev"

  private_subnet_ids = module.vpc.private_subnet_ids

  eks_cluster_role_arn = module.iam.eks_cluster_role_arn
  eks_node_role_arn    = module.iam.eks_node_role_arn
}

module "rds" {
  source = "../../modules/rds"

  project_name = "novasupply"
  environment  = "dev"

  database_subnet_ids = module.vpc.database_subnet_ids

  rds_security_group_id = module.security_groups.rds_security_group_id
}

module "redis" {
  source = "../../modules/redis"

  project_name = "novasupply"
  environment  = "dev"

  database_subnet_ids = module.vpc.database_subnet_ids

  redis_security_group_id = module.security_groups.redis_security_group_id
}

module "ecr" {
  source = "../../modules/ecr"

  project_name = "novasupply"
  environment  = "dev"
}