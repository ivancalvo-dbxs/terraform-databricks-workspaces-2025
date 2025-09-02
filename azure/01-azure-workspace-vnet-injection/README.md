# Step 1. Install Azure CLI and Terraform

- [Install Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
- [Install Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
- [Install Terraform (AMD64)](https://developer.hashicorp.com/terraform/install)
    - **Avoid 386 on Windows**
    - **Avoid 386 on Windows**
    - **Avoid 386 on Windows**

# Step 2. Login into Azure using the CLI

```console
az login
```

# Step 3. Clone the repo and fill terraform.tfvars

- Download the repo:
```console
git clone REPO_URL
```

- Open the folder with your favorite text editor

- Replace the values

# Step 4. Terraform commands

- cd into the *azure-vnet-injection* folder

- Run the following commands:

```console
terraform init
```

```console
terraform plan
```

```console
terraform apply
```

# Step 5. Enjoy your Databricks Workspace