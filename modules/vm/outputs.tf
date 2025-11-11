output "vm_id" {
  description = "The ID of the Virtual Machine"
  value       = azurerm_virtual_machine.vm.id
}

output "vm_private_ip" {
  description = "The private IP address of the Virtual Machine"
  value       = azurerm_network_interface.nic.private_ip_address
}

output "vnet_id" {
  description = "The ID of the Virtual Network"
  value       = azurerm_virtual_network.vnet.id
}

output "subnet_id" {
  description = "The ID of the Subnet"
  value       = azurerm_subnet.subnet.id
}

output "nic_id" {
  description = "The ID of the Network Interface"
  value       = azurerm_network_interface.nic.id
}