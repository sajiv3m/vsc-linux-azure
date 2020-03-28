# Definition for the Linux Server hosting VSC (Visual Studio Code)

resource "azurerm_virtual_machine" "vsc-linux-vm" {
    name                  = var.linux_server_name
    location              = var.azure_location
    resource_group_name   = azurerm_resource_group.vsc-linux-vm.name
    network_interface_ids = [azurerm_network_interface.vsc-linux-vm.id]
    vm_size               = var.linux_server_size

    storage_os_disk {
        name              = "${var.linux_server_name}-osdisk"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Premium_LRS"
    }

    storage_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }

    os_profile {
        computer_name  = var.linux_server_name
        admin_username = var.linux_server_user
    }


#   Using the same key pair files created for UCP host
    os_profile_linux_config {
        disable_password_authentication = true
        ssh_keys {
            path     = "/home/${var.linux_server_user}/.ssh/authorized_keys"
            key_data = file(var.path_to_public_key)
        }
    }

#   copy scripts and files for linux hosts from lin-files folder to /tmp on target VM
    provisioner "file" {
        source = "lin-files"
        destination = "/tmp"
    } 


/*  Installing apps using remote-exec */
    provisioner "remote-exec" {
        inline = [
#   Installing other apps
        "chmod +x /tmp/lin-files/install*.sh",
        "echo Installing applications...",
        "/tmp/lin-files/install_other_apps.sh",
#   changing all files to read-only by root        
        "sudo chmod 600 /tmp/lin-files/install*.sh"
        ]
    }

/*  Following is the connection info for all the remote-exec and remote file copy (provisioner - file) mentioned above */
    
    connection {
        user = var.linux_server_user
        private_key = file(var.path_to_private_key)
        host = azurerm_public_ip.vsc-linux-vm.fqdn
        port = "22"
    }

#   Place to store the boot diagnostics of the VM
    boot_diagnostics {
        enabled     = "true"
        storage_uri = azurerm_storage_account.vsc-linux-vm.primary_blob_endpoint
    }

    tags = local.common_tags
    
}
