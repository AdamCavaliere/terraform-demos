resource "azurerm_resource_group" "resource_gp" {
  name     = "${var.app_name}-rg"
  location = "${var.location}"
}

resource "azurerm_virtual_network" "network" {
  name                = "${var.app_name}-network"
  address_space       = ["10.0.0.0/16"]
  location            = "${azurerm_resource_group.resource_gp.location}"
  resource_group_name = "${azurerm_resource_group.resource_gp.name}"
}

resource "azurerm_subnet" "main" {
  name                 = "mainsubn"
  resource_group_name  = "${azurerm_resource_group.resource_gp.name}"
  virtual_network_name = "${azurerm_virtual_network.network.name}"
  address_prefix       = "10.0.3.0/24"
}
