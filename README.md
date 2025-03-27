**# AWS Resource Deployment Using Terraform, GitHub & Jenkins**

**## Project Overview**
This project focuses on provisioning a **three-tier AWS infrastructure** using **Terraform** and **Jenkins**. The client requires an automated infrastructure deployment process without application deployment. The infrastructure provisioning is managed through a **Jenkins pipeline**, ensuring a streamlined and automated workflow.

**## Tools & Technologies Required**
- **AWS Services**: EC2, S3, DynamoDB  
- **Terraform**: Infrastructure as Code (IaC) tool  
- **Jenkins**: CI/CD automation server  
- **GitHub**: Version control for Terraform scripts  
- **VS Code**: Code editor for writing Terraform configurations  

**## Project Workflow**

**### 1. Repository Setup**
- Create a GitHub repository and push Terraform scripts to a **feature branch (US-4321)**.
- Set up **collaborator access** and enforce **code review rules** before merging into the main branch.

**### 2. Jenkins Setup**
- Deploy Jenkins on an **EC2 instance**.
- Install required plugins: **Terraform, AWS CodeDeploy, Amazon EC2 Plugin**.
- Add **GitHub and AWS credentials** in Jenkins credential store.
- Configure a **Multibranch Pipeline Job** for GitHub repository integration.

**### 3. Infrastructure Deployment Using Terraform**
- Write and push a **Jenkinsfile** in the Terraform folder to automate infrastructure deployment.
- Define pipeline stages:
  - **Terraform Init**: Initialize backend using **S3 for state storage** and **DynamoDB for state locking**.
  - **Terraform Plan**: Generate an execution plan for infrastructure changes.
  - **Terraform Apply**: Apply changes to the AWS environment (only in the **main branch**).

**### 4. Backend Setup**
- Create an **S3 bucket** for storing Terraform state files.
- Create a **DynamoDB table** for state locking.

**### 5. Deployment Execution**
- Run `terraform init`, `terraform plan`, and `terraform apply` for backend provisioning.
- Raise a **Pull Request (PR)** to merge Terraform files from the **feature branch** to **main**.
- Verify the **Jenkins pipeline execution** for both branches.

**### 6. Validation & Finalization**
- Ensure Terraform state files are stored in **S3**.
- Confirm that the infrastructure setup is complete and ready for application deployment.

**## Expected Outputs**
✅ Fully automated three-tier AWS infrastructure provisioning.  
✅ **Jenkins pipeline** ensures seamless deployment.  
✅ **S3 remote state storage** and **DynamoDB state locking**.  
✅ **Version-controlled Terraform scripts** in GitHub.  
✅ Scalable, secure, and efficiently managed cloud infrastructure.  

**## Conclusion**
This project successfully automated AWS infrastructure deployment using **Terraform and Jenkins**, enabling seamless provisioning through a CI/CD pipeline. The use of **S3 and DynamoDB** for backend storage enhances security and reliability, ensuring a well-structured cloud infrastructure setup.
