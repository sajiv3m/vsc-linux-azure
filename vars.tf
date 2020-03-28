locals {
  # Common tags to be assigned to all resources
  common_tags = {
    Environment = "Development"
    Purpose   = "Host Visual Studio Code"
  }
}

variable "azure_subscription_id" {}
variable "azure_client_id" {}
variable "azure_tenant_id" {}
variable "azure_client_secret" {}
variable "azure_location" {}

variable "linux_server_name" {}
variable "linux_server_size" {}
variable "linux_server_user" {}

variable "linux_server_fqdn" {}

variable "linux_resource_group" {}
variable "linux_storage_account" {}

variable "path_to_private_key" {}
variable "path_to_public_key" {}


variable "allowed_ports" {
  type = list(string)
  default = ["80", "443", "8080"]
}


variable "linux_vnet_name" {}
variable "linux_subnet_name" {}
variable "linux_nsg_name" {}

variable "linux_subnet" {}
variable "linux_vnet" {}
