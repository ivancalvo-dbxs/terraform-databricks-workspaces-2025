# Considerations

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
            - 1x s3-uc access role.
    - Databricks:
        - 1x workspace
            - uses most of the previous AWS resources.
        - 1x metastore
            - uses 1x S3 bucket and 1x IAM role
        - 2x Databricks groups.
            - UC admins
            - Workspace users.
        
        workspace and metastore.
- **If you want to use this template for just the workspace, remove the unity catalog metastore module call on main.tf (line 34 and below)**


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
- Copy the repo HTTPS URL
    - On the main repo page, click on the green code button and copy it.

- Download it locally using the git command:
```console
git clone REPO_URL
```

## 2. CD into the repo
- cd into the *aws-workspace-metastore* folder
```console
cd /path/to/repo/aws-workspace-metastore
```

# Step 4. Open the repo folder with a text editor

## 1. Replace the values on *terraform.tfvars* file
- Use Visual Studio Code or Sublime text.
- Replace the values

# Step 5. Terraform commands

- Once you *cd* into the cd into the *aws-workspace-metastore* folder, run the following commands:

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