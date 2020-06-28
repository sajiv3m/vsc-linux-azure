# Azure location name
azure_location = "uksouth"

# Linux server details
linux_server_name = "vsc-linux"
linux_server_size = "Standard_DS11_v2"
linux_server_user = "vsc-user"

# Give a unique name, the URL will be https://<name you give here>.uksouth.cloudapp.azure.com:8080/
linux_server_fqdn = "give a unique name"


linux_resource_group = "vscgrplinuxserver"
linux_storage_account = "<unique storage account name>"
linux_vnet_name = "vsclinuxvnet"
linux_subnet_name = "vsclinuxsubnet"
linux_nsg_name = "vsclinuxnsg"

linux_vnet = "10.0.0.0/16"
linux_subnet = "10.0.1.0/24"

# name of the ssh key pair files, change it as needed
path_to_private_key = "vsc-linux-key"
path_to_public_key = "vsc-linux-key.pub"


