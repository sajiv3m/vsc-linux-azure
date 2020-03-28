# Definition file for the VNET

resource "azurerm_virtual_network" "vsc-linux-vm" {
    name                = var.linux_vnet_name
    address_space       = [var.linux_vnet]
    location            = var.azure_location
    resource_group_name = azurerm_resource_group.vsc-linux-vm.name

    tags = local.common_tags
}

