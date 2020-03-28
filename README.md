# Terraform files to deploy Linux server in Azure

## Follow the steps below to deploy the Linux server with essential tools

1. Clone the repository to your local system
   `git clone https://github.com/sajiv3m/vsc-linux-azure.git`
2. [Download latest version of Terraform >= v0.12.24](https://www.terraform.io/downloads.html)
3. Create a Service Principal (SPN) for Terraform in your Azure Subscription 
```
az login
az account list
az account set -s "Your subscription name"
SUBSCRIPTION_ID=$(az account show|jq -r '.id')
echo "Subscription ID: $SUBSCRIPTION_ID"
az ad sp create-for-rbac -n "terraform-spn" --role="Contributor" --scopes="/subscriptions/$SUBSCRIPTION_ID"
```
4. Note the `appID`, `password`, `tenant` from the output of above command and create the `secret.tfvars` file
```
# Contents of secret.tfvars file with credentials of SPN created for terraform: terraform-spn
azure_subscription_id = "copy your subscription ID"
azure_client_id = "copy the appID"
azure_client_secret = "copy the password"
azure_tenant_id = "copy the tenant"
```
5. Generate SSH key pair which will be used to login to Linux server
   `ssh-keygen -m PEM -f vsc-linux-key`
6. Update `terraform.tfvars` file with details of network, server, storage, location, ssh key pair
7. Initialize terraform by executing `terraform init`
8. Confirm there are no errors by executing `terraform plan -var-file="secret.tfvars"`
9. Execute `terraform apply -var-file="secret.tfvars"` to build the server.
10. Login and test access to server `ssh -i vsc-linux-key <user-id>@<fqdn-name>.<location>.cloudapp.azure.com`

