# Terraform EC2 Instance Deployment

This project deploys EC2 instances in AWS using Terraform. It includes automated workflows for applying and destroying infrastructure. The setup uses **IAM credentials** for authentication and **GitHub Actions** for CI/CD.

---

## **Prerequisites**

Before using this project, ensure you have the following:

1. **AWS Account**:
   - An AWS account with permissions to create EC2 instances, security groups, and related resources.
   - An IAM user with programmatic access (access key and secret key).

2. **GitHub Repository**:
   - A GitHub repository to store the Terraform code and workflows.

3. **Terraform Installed** (Optional for Local Testing):
   - Install Terraform from [here](https://www.terraform.io/downloads.html).

4. **AWS CLI** (Optional for Local Testing):
   - Install the AWS CLI from [here](https://aws.amazon.com/cli/).

---

## **Setup**

### **1. Clone the Repository**
Clone the repository to your local machine:
```bash
git clone https://github.com/NAVEEN0069/hello-world-instance.git
cd hello-world-instance
```

**2. Store AWS Credentials in GitHub Secrets**
- Go to your GitHub repository.
- Navigate to Settings > Secrets and variables > Actions.

**Add the following secrets:**
- AWS_ACCESS_KEY_ID: Your IAM user's access key.
- AWS_SECRET_ACCESS_KEY: Your IAM user's secret key.
- AWS_DEFAULT_REGION: The AWS region (e.g., us-east-1).

3. Configure Terraform Variables
Update the terraform.tfvars file with your key pair name:
```hcl
instance_type = "t2.micro"
key_name      = "your-existing-key-pair-name" # Replace with your key pair name
```
4. Push Changes to GitHub
Push the code to the main branch to trigger the Terraform Apply workflow:

```bash
git add .
git commit -m "Initial commit"
git push origin main
```
---

**Workflows**

**1. Terraform Apply (Automated)**
This workflow runs automatically when changes are pushed to the main branch.
**It performs the following steps:**
- Initializes Terraform (terraform init).
- Validates the Terraform configuration (terraform validate).
- Plans the infrastructure changes (terraform plan).
- Applies the changes to create resources (terraform apply -auto-approve).

**2. Terraform Destroy (Manual)**

**NOTE: Since we don't have backend.tf not configured for Remote state file management we can't use Destroy Workflow**

This workflow is triggered manually to destroy the infrastructure.
**To trigger it:**
- Go to your GitHub repository.
- Navigate to Actions.
- Select the Terraform Destroy workflow.
- Click the Run workflow button.

---

**How It Works**

Terraform Configuration
- main.tf: Defines the resources to be created (EC2 instances, security groups, etc.).
- variables.tf: Contains input variables for the Terraform configuration.
- outputs.tf: Outputs the public IP and instance ID of the EC2 instances.
- provider.tf: Configures the AWS provider and Terraform version.

Modules
- modules/ec2-instance: Reusable module for creating EC2 instances.
- modules/security-group: Reusable module for creating security groups.

GitHub Actions
- .github/workflows/terraform-apply.yml: Workflow for applying Terraform changes.
- .github/workflows/terraform-destroy.yml: Workflow for destroying Terraform resources.