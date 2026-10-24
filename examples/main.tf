locals {
  subscription_id = "34f2846b-1dd2-4626-a944-e9e457aad29f"
  default_tags = {
    environment = "Dev"
    project     = "dtx"
    owner       = "suraj"
    app-id      = "APP-1001" ## APP ID from reff
  }
}


module "enable_sub_policy" {
  source = "../modules/deny-all-policy"

  subscription_id = local.subscription_id
  # allowed_resource_types = var.allowed_resource_types
  allowed_resource_types = [
    # "Microsoft.Compute/virtualMachines",
    # "Microsoft.Network/virtualNetworks",
    # "Microsoft.Network/networkInterfaces",
    # "Microsoft.Network/publicIPAddresses",
    # "Microsoft.Network/networkSecurityGroups",
    "Microsoft.Storage/storageAccounts",
    # "Microsoft.Sql/servers",
    # "Microsoft.ContainerService/managedClusters",
    # "Microsoft.App/containerApps",
    # "Microsoft.KeyVault/vaults",
    # "Microsoft.Compute/disks",
    # "Microsoft.EventHub/namespaces",
    # "Microsoft.ServiceBus/namespaces",
    # "Microsoft.CosmosDB/accounts",
    # "Microsoft.DataFactory/factories",
    # "Microsoft.Synapse/workspaces",
    # "Microsoft.SignalRService/SignalR",
    # "Microsoft.BotService/botServices",
    # "Microsoft.CognitiveServices/accounts",
    # "Microsoft.MachineLearningServices/workspaces",
    # "Microsoft.Search/searchServices",
    # "Microsoft.Web/sites",
    # "Microsoft.Web/serverfarms",
    # "Microsoft.Network/applicationGateways",
    # "Microsoft.Network/loadBalancers",
    # "Microsoft.Network/trafficManagerProfiles",
    # "Microsoft.Network/dnszones",
    # "Microsoft.Resources/subscriptions/resourceGroups",
    "Microsoft.Authorization/policyDefinitions",
    "Microsoft.Authorization/policyAssignments"
  ]




}
