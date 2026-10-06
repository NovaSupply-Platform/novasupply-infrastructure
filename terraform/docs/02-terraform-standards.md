# Terraform Standards

## Terraform Version

> = 1.6

---

## State Management

Remote Backend:

- S3

State Locking:

- DynamoDB

---

## Environment Strategy

- dev
- stage
- prod

---

## Module Design

Each AWS resource must be implemented using reusable Terraform modules.

Examples:

- vpc
- eks
- rds
- redis
- route53

---

## Code Standards

- terraform fmt
- terraform validate
- terraform plan

must pass before merge.

---

## Branch Strategy

main

develop

feature/\*
