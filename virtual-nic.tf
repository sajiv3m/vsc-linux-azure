# Definition file for the NIC card
resource "azurerm_network_interface" "vsc-linux-vm" {
    name                = "vscnic"
    location            = var.azure_location
    resource_group_name = azurerm_resource_group.vsc-linux-vm.name

    ip_configuration {
        name                          = "vsc-linux-vm-nic-config"
        subnet_id                     = azurerm_subnet.vsc-linux-vm.id
        private_ip_address_allocation = "dynamic"
        public_ip_address_id          = azurerm_public_ip.vsc-linux-vm.id
    }

   tags = local.common_tags
}
