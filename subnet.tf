# Definition file for the subnet to which all hosts are connected to

resource "azurerm_subnet" "vsc-linux-vm" {
    name                 = var.linux_subnet_name
    resource_group_name  = azurerm_resource_group.vsc-linux-vm.name
    virtual_network_name = azurerm_virtual_network.vsc-linux-vm.name
    address_prefix       = var.linux_subnet
}

# The Network security group (NSG) / Firewall rules are applied to the subnet
resource "azurerm_subnet_network_security_group_association" "vsc-linux-vm" {
    subnet_id                 = azurerm_subnet.vsc-linux-vm.id
    network_security_group_id = azurerm_network_security_group.vsc-linux-vm.id
}
