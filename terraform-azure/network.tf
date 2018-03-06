resource "azurerm_virtual_network" "network" {
    name = "${var.app_name}-network"
    address_space = [ "10.0.0.0/16"]
    location = "${azurerm_resource_group.resource_gp.location}"
    resource_group_name = "${azurerm_resource_group.resource_gp.name}"
}

resource "azurerm_subnet" "test" {
  name                 = "testsubnet"
  resource_group_name  = "${azurerm_resource_group.resource_gp.name}"
  virtual_network_name = "${azurerm_virtual_network.network.name}"
  address_prefix       = "10.0.${count.index + 1}.0/24"
  count = 2
}

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

