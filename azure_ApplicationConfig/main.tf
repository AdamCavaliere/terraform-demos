resource "azurerm_network_interface" "netint" {
  name                = "networkinterface-${count.index + 1}"
  location            = "${azurerm_resource_group.resource_gp.location}"
  resource_group_name = "${azurerm_resource_group.resource_gp.name}"
  count = 2
  ip_configuration {
    name                          = "ipconfig-${count.index + 1}"
    subnet_id                     = "${element(azurerm_subnet.test.*.id, count.index)}"
    private_ip_address_allocation = "dynamic"
  }
}