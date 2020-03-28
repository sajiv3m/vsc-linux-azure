# Definition file to print the Name and IP address of Linux server hosting VSC
output "Linux-host-name" {
  value = "${azurerm_public_ip.vsc-linux-vm.fqdn}"
}

output "Linux-host-ip" {
  value = "${azurerm_public_ip.vsc-linux-vm.ip_address}"
}
