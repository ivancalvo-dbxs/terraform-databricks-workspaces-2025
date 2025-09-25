# Youtube Tutorial

[How to create a Databricks AWS workspace with a custom-VPC using Terraform
](https://www.youtube.com/watch?v=t5vyL1RKXUE)

# After deployment setup required!

* There are post-deployment manual configurations.
* There are post-deployment manual configurations.
* **Don't skip the last section of the README.md**.
* **Don't skip the last section of the README.md**.

# What this templates creates?

- This template is great for your initial AWS deployment, it creates:
    - AWS resources:
        - 1x VPC
            - 2x private subnets
            - 1x public subnet
            - 1x security group
            - 1x nat gateway
        - 1x S3 bucket
        - 2x IAM roles
            - 1x cross-account role.
            - 1x S3-uc access role.
    - Databricks:
        - 1x workspace
        - 1x catalog
        - 2x Databricks groups
            - Workspace users.
            - Workspace admins.


# Step 1. Install GIT, AWS CLI and Terraform

- [Install Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
- [Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- [Install Terraform (AMD64)](https://developer.hashicorp.com/terraform/install)
    - **Avoid 386 on Windows**
    - **Avoid 386 on Windows**
    - **Avoid 386 on Windows**

# Step 2. Create a new AWS profile (for Terraform)

## Get your credentials

- Open the AWS Console
- Click on your username near the top right and select Security Credentials
- Click on Users in the sidebar
- Click on your username
- Click on the Security Credentials tab
- Click Create Access Key
- Click Show User Security Credentials

## 2. Create the profile using the previous credentials

Replace **PROFILE_NAME** with your desired profile name, it can be *terraform-dev*

```console
$ aws configure --profile PROFILE_NAME
AWS Access Key ID [*************xxxx]: <Your AWS Access Key ID>
AWS Secret Access Key [**************xxxx]: <Your AWS Secret Access Key>
Default region name: [us-east-2]: us-east-2
Default output format [None]: json
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

- Open this folder (02-aws-workspace) with Visual Studio Code, Sublime text or your favorite text editor.
- Replace the values on *terraform.tfvars* file.


# Step 4. Terraform time

## CD into the repo

cd into the **01-aws-workspace-metastore** folder
```console
cd /path/to/repo/02-aws-workspace
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

### Add users to the group.
    - Go to User Management on the left panel.
    - Click on Groups tab.
    - Add users to the new groups: dev-users and dev-admins in case you leave the environment value as dev.
    - Users are now allow to access the workspace.

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