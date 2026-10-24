# Deny All Azure Resources Policy

## Purpose

This module creates a custom Azure Policy definition and assigns it
at the subscription level to deny Azure Resource Manager resource
deployments, except resource-group operations.

## Requirements

- Terraform >= 1.5
- AzureRM provider >= 4.0
- An existing Azure subscription
- Permissions to create policy definitions and assignments

## Usage

module "deny_all_policy" {
  source = "./modules/deny-all-policy"

  subscription_id = var.subscription_id
}

## Resources Created

- Azure custom policy definition
- Azure subscription policy assignment

## Limitations

- Does not delete existing resources.
- Does not guarantee a zero Azure bill.
- Does not block every billing event or every operation
  offered by Azure services.
- Does not prevent an authorized user from removing the assignment.
- Policy definition and assignment permissions must be protected
  through Azure RBAC.

## Removal

Run terraform destroy from the root configuration to remove
the policy assignment and definition managed by this module.

Review the impact before removing the policy.