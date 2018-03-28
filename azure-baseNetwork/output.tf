output "mainsubnet" {
  value = "${azurerm_subnet.main.id}"
}

output "location" {
  value = "${var.location}"
}
