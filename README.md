# terraform-pipeline

## Module Documentation

- Each module (`modules/vpc`, `modules/ec2`, `modules/elb`, `modules/autoscaling`) should have its own `README.md` describing:
  - Purpose
  - Inputs (variables)
  - Outputs
  - Example usage

---

## Example tfvars

Create a `terraform.tfvars` file for each environment (dev, staging, prod) to override variables as needed.

---

## Remote State

This project uses S3 for remote state and recommends DynamoDB for state locking. See `backend.tf` for configuration.

---

## Provider

AWS provider is pinned in `provider.tf` for stability and reproducibility.

---

## Outputs

Key outputs from each module are exposed for cross-stack and operational use (see each module's `outputs.tf`).

---