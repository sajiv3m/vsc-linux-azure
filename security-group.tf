/*  Definition file for the firewall rules / NSG applicable for all hosts in the cluster
    Lower the priority number, higher the priority of the rule */

resource "azurerm_network_security_group" "vsc-linux-vm" {
    name                = var.linux_nsg_name
    location            = var.azure_location
    resource_group_name = azurerm_resource_group.vsc-linux-vm.name

/*  SSH to be disabled after initial testing, hence mentioned separately */

    security_rule {
        name                       = "ssh-access"
        priority                   = 900
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_ranges    = ["22"]
        source_address_prefix      = "0.0.0.0/0"
        destination_address_prefix = "*"
    }

    security_rule {
        name                       = "https-access"
        priority                   = 910
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_ranges    = var.allowed_ports
        source_address_prefix      = "0.0.0.0/0"
        destination_address_prefix = "*"
    }

    tags = local.common_tags
}

