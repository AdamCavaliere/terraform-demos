output "private_ips" {
  value = "${azurerm_network_interface.netint.*.private_ip_address}"
}
