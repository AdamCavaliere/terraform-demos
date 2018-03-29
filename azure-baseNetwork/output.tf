output "mainsubnet" {
  value = "${azurerm_subnet.main.id}"
}

output "location" {
  value = "${azurerm_resource_group.resource_gp.location}"
}
