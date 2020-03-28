# Definition file for the Storage account

resource "azurerm_storage_account" "vsc-linux-vm" {
    name                = var.linux_storage_account
    resource_group_name = azurerm_resource_group.vsc-linux-vm.name
    location            = var.azure_location
    account_replication_type = "lrs"
    account_tier = "standard"

    tags = local.common_tags
}

