# Network Design

## AWS Region

ap-south-1

---

## VPC CIDR

10.0.0.0/16

---

## Availability Zones

ap-south-1a

ap-south-1b

ap-south-1c

---

## Subnets

### Public

10.0.1.0/24

10.0.2.0/24

10.0.3.0/24

### Private

10.0.11.0/24

10.0.12.0/24

10.0.13.0/24

### Database

10.0.21.0/24

10.0.22.0/24

10.0.23.0/24

---

## Components

Public:

- ALB
- NAT Gateway

Private:

- EKS Nodes
- Applications

Database:

- RDS PostgreSQL
- Redis

---

## Network Security Principles

- No direct internet access to EKS worker nodes
- Databases deployed in private database subnets
- Ingress traffic routed through Application Load Balancer
- Egress internet access controlled through NAT Gateway
- Security Groups enforce least privilege access
- VPC Flow Logs enabled for network monitoring and auditing
