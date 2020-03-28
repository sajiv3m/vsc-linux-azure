# Definition file for the provider - Microsoft Azure
# This file has the connection details for the specific Microsoft Azure tenant and subscription
provider "azurerm" { 
    version = "=2.0.0"
    features {}
    subscription_id = var.azure_subscription_id
    client_id = var.azure_client_id
    client_secret = var.azure_client_secret
    tenant_id = var.azure_tenant_id
}
