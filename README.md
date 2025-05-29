# AWS Terraform Project

This project demonstrates key Terraform concepts for AWS infrastructure management using a modular and structured approach. It provisions a complete environment with modules for EC2, IAM, S3, and Security Groups, and shows best practices for managing infrastructure as code.  
**Additionally, this repository includes practical examples of importing existing AWS resources into Terraform management.**

## **Project Structure** 
```text
.
├── README.md
├── main.tf
├── variables.tf
├── locals.tf
├── backend.tf
├── terraform.tfvars
├── Import/
│   ├── README.md
│   └── import.tf
└── Modules/
    ├── EC2/
    │   ├── main.tf
    │   └── variables.tf
    ├── IAM/
    │   ├── main.tf
    │   ├── outputs.tf
    │   └── variables.tf
    ├── S3/
    │   ├── main.tf
    │   └── variables.tf
    └── security-group/
        ├── main.tf
        ├── output.tf
        └── variables.tf
```

## **Prerequisites**
- Terraform v1.0.0 or newer
- AWS CLI installed and configured
- AWS account with appropriate permissions

## **Getting Started**
- Clone this repository
- Authenticate with AWS: `aws configure`

## **Terraform Commands Demonstrated**
- `terraform init`: Initialize working directory
- `terraform plan`: Preview changes
- `terraform apply`: Apply changes
- `terraform destroy`: Destroy infrastructure
- `terraform import`: Import existing resources (see Import/ directory)
- `terraform state list`: List resources in state
- `terraform state show`: Show resource details
- `terraform validate`: Validate configuration
- `terraform fmt`: Format configuration files

## **State Management**
This project demonstrates state management using a remote backend (see `backend.tf`). For local development, you can use the default local state file, but for team environments, configure the backend to use AWS S3 and DynamoDB for state locking and consistency.

## **Variable Files**
Environment-specific variables can be managed using `terraform.tfvars`. Adjust and extend as needed for your environments.

- `terraform.tfvars`: Default variables for the environment

## **Backend Configuration**
The `backend.tf` file defines the backend for storing the Terraform state.  
Before running Terraform in a team or production environment, configure the backend for remote storage (e.g., AWS S3 with DynamoDB for state locking).

Example for AWS S3 backend:
```hcl
terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}
```

## **Importing Existing AWS Resources**
The `Import/` directory demonstrates how to bring existing AWS resources under Terraform management.

For example, `Import/import.tf` shows how to import an existing EC2 instance:
```hcl
provider "aws" {
  region = "ap-south-1"
}

import {
  to = aws_instance.vm
  id = "i-06fc33be4eb09849d"
}
```
**Steps to Import an Existing Resource:**
1. Define the corresponding resource in your Terraform code (e.g., `resource "aws_instance" "vm" { ... }` in `main.tf` or a module).
2. Use the import block (as shown above) or run the CLI command:
   ```bash
   terraform import aws_instance.vm i-06fc33be4eb09849d
   ```
3. Once imported, run `terraform plan` to see the current state and make further changes as code.

This approach allows you to manage existing AWS resources with Terraform while keeping your infrastructure as code consistent.

### Initialize Terraform
```bash
terraform init
```

### Plan Terraform
```bash
terraform plan
```

### Apply Terraform
```bash
terraform apply
```

### Destroy Terraform
```bash
terraform destroy
```

## **Notes**
- Ensure your AWS credentials are properly configured before running these scripts.
- The `Modules/` directory contains modular resources for EC2, IAM, S3, and Security Groups; add or modify modules as needed in `main.tf`.
- The `Import/` folder demonstrates importing existing AWS resources into Terraform management, including an example for EC2 instance import in `Import/import.tf`.
