resource "azurerm_resource_group" "bsts-rg" {
  name     = "bsts-resources"
  location = "Australia East"
}

resource "azurerm_network_security_group" "nsg" {
  name                = "bsts-security-group"
  location            = azurerm_resource_group.bsts-rg.location
  resource_group_name = azurerm_resource_group.bsts-rg.name
}

resource "azurerm_virtual_network" "vnet1" {
  name                = "bsts-network-1"
  location            = azurerm_resource_group.bsts-rg.location
  resource_group_name = azurerm_resource_group.bsts-rg.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "public-subnet"
    address_prefix = "10.0.1.0/24"
    security_group = azurerm_network_security_group.nsg.id
  }

  subnet {
    name           = "private-subnet"
    address_prefix = "10.0.2.0/24"
  }

  tags = {
    environment = "TESTING"
  }
}