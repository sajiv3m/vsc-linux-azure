/*  Definition file for the public IP address for the Linux server
    Allocation method must be Static, so the IP address is assigned immediately
    for Dynamic allocation method, IP address is only assigned when the NIC is attached to VM */
resource "azurerm_public_ip" "vsc-linux-vm" {
    name                 = "vsclinux-publicip"
    location			 = var.azure_location
    allocation_method	 = "Static"
    resource_group_name  = azurerm_resource_group.vsc-linux-vm.name
    domain_name_label    = var.linux_server_fqdn

    tags = local.common_tags

}

