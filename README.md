# Terraform files to deploy Linux server in Azure

## Steps to perform

1. Clone the repository
2. Create secret.tfvars file and update the appid, password
3. terraform init
4. terraform plan -var-file="secret.tfvars"

