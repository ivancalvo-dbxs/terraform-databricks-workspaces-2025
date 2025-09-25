# Youtube Tutorial

[How to create a Databricks AWS workspace with a custom-VPC using Terraform
](https://www.youtube.com/watch?v=jVMgw0_Z3h8)

# After deployment setup required!

* There are post-deployment manual configurations.
* There are post-deployment manual configurations.
* **Don't skip the last section of the README.md**.
* **Don't skip the last section of the README.md**.

# What this templates creates?

- This template is great for your initial AWS deployment, it creates:
    - Azure resources:
        - 1x Resource group.
            - 1x VNET
                - 2x private subnets
                - 1x public subnet
                - 1x security group
                - 1x nat gateway
            - 1x Databricks Workspace resource.
        
        - 1x Managed-resource group.
            - 1x Databricks Access Connector.
            - 1x ADLS Storage Account and Container.

    - Databricks:
        - 1x Workspace
        - 1x Catalog.

# Step 1. Install GIT, Azure CLI and Terraform

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

# Step 3. Clone the repo

## Download the repo

Clone it in your favorite computer directory.

- Copy the repo HTTPS URL
    - On the main repo page, click on the green code button and copy it.

- Download it locally using the git command:
```console
git clone REPO_URL
```

## Replace the values on **terraform.tfvars** file

- Open this folder (01-azure-workspace-vnet-injection) with Visual Studio Code, Sublime text or your favorite text editor.
- Replace the values on *terraform.tfvars* file.


# Step 4. Terraform time

## CD into the repo

cd into the **01-azure-workspace-vnet-injection** folder
```console
cd /path/to/repo/01-azure-workspace-vnet-injection
```

## Terraform commands

- After the previous step, run:

```console
terraform init
```

```console
terraform plan
```

```console
terraform apply
```

# Step 5. Before using the Workspace

- At this point in time, the Service Principal is the owner of the deployed assets.
- Pass the ownership to groups.

## On the Account Console:

### Add users and groups.
    - Go to User Management on the left panel.
    - Click on Groups tab.
    - Add groups: [environment]-users, [environment]-admins and unity-admins.
        - i.e dev-users and dev-admins if you deployed dev workspace.
        - unity-admins group.
            - One time configuration, if you're deploying a second workspace skip this.
    - Add the groups to the workspaces.
        - Click on Workspaces on the left panel.
        - Click on the deployed workspace.
        - Click on the permissions Tab.
        - Add dev-users as User.
        - Add dev-admins as Admin.
    - Add users to the groups.
    - Users are now allow to access the workspace as user or admin.

### Metastore ownership.
    - Go to Catalog on the left panel.
    - Click on the metastore.
    - Edit the Metastore Admin.
    - Replace the Service Principal with the unity-admins group.

## On the Workspace:

### Catalog:
    - Go to Catalog on the left panel.
    - In the middle panel, click on the catalog. (dev catalog if you leave it default).
    - Edit the Owner.
    - Replace the Service Principal with the unity-admins group.

### Storage Credential and External Locations:
    - Go to Catalog on the left panel.
    - Click on External Data.
    - Go to the Credential tab.
    - Edit the owner of all the credentials.
    - Replace the Service Principal with the unity-admins group.
    - Repeat the same on the External Locations tab.