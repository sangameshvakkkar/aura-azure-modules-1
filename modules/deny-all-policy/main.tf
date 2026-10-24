resource "azurerm_policy_definition" "allowed_resources" {
  name         = var.policy_name
  policy_type  = "Custom"
  mode         = "All"
  display_name = var.policy_display_name
  description  = "Allows only explicitly approved Azure resource types."

  metadata = jsonencode({
    category = "Cost Management"
    version  = "1.0.0"
  })

  parameters = jsonencode({
    allowedResourceTypes = {
      type = "Array"
      metadata = {
        displayName = "Allowed Resource Types"
        strongType  = "ResourceTypes"
      }
      defaultValue = [
        "Microsoft.Resources/subscriptions/resourceGroups",
        "Microsoft.Authorization/policyDefinitions",
        "Microsoft.Authorization/policyAssignments"
      ]
    }
    }
  )
  policy_rule = jsonencode({
    if = {
      allOf = [
        {
          field = "type"
          notIn = "[parameters('allowedResourceTypes')]"
        }
      ]
    }
    then = {
      effect = "deny"
    }
    }
  )
}



resource "azurerm_subscription_policy_assignment" "allowed_resources" {
  name                 = var.policy_name
  display_name         = var.policy_display_name
  subscription_id      = "/subscriptions/${var.subscription_id}"
  policy_definition_id = azurerm_policy_definition.allowed_resources.id
  enforce              = true

  parameters = jsonencode({
    allowedResourceTypes = {
      value = var.allowed_resource_types
    }
  })

  non_compliance_message {
    content = "This resource type is not approved for the learning subscription. Add it to the allowlist only after reviewing its potential cost"
  }
}


variable "policy_name" {
  default = "deny-all-resources"
  type    = string
}

variable "policy_display_name" {
  default = "Deny All Resources"
  type    = string
}

variable "subscription_id" {
  type = string
}

variable "allowed_resource_types" {
  default = [
    "Microsoft.Resources/subscriptions/resourceGroups"
  ]
  type = list(string)
}



output "policy_assignment_id" {
  value = azurerm_subscription_policy_assignment.allowed_resources.id
}

output "policy_definition_id" {
  value = azurerm_policy_definition.allowed_resources.id
}

output "allowed_resource_types" {
  value = var.allowed_resource_types

}
