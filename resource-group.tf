# Definition file for the Resource group in Azure
resource "azurerm_resource_group" "vsc-linux-vm" {
    name     = var.linux_resource_group
    location = var.azure_location

    tags = local.common_tags
}
