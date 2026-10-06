# Network Design

## AWS Region

us-east-1

---

## VPC CIDR

10.0.0.0/16

---

## Availability Zones

us-east-1a

us-east-1b

us-east-1c

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

- RDS
- Redis
