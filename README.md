<img width="1024" height="893" alt="image" src="https://github.com/user-attachments/assets/e6651d83-c0d8-468f-9cf9-6cd4988ab533" />



<img width="1077" height="671" alt="image" src="https://github.com/user-attachments/assets/e46a5255-95e1-40fa-b834-3d92b616705d" />


<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/0c91b824-8a99-4a58-9a8b-27b09ff0e939" />


---


# Terraform Guide

## 📌 What is Terraform?
Terraform is an **Infrastructure-as-Code (IaC)** tool created by HashiCorp, written in Go.  
It allows DevOps teams to automate cloud resource provisioning across multiple providers (AWS, Azure, GCP, etc.) using declarative configuration files.

---

## 🖼️ Terraform Architecture Diagram
![Terraform Architecture](https://copilot.microsoft.com/th/id/BCO.4c0f3de6-9ca4-4f17-ac95-95f83795d7e1.png)

---

## 🚀 Benefits of IaC
- **Speed & Simplicity** – Spin up infrastructure with scripts instead of manual setup.
- **Collaboration** – Teams can version-control IaC with GitHub.
- **Error Reduction** – Standardized configurations reduce human mistakes.
- **Disaster Recovery** – Re-run scripts to rebuild infrastructure quickly.
- **Enhanced Security** – Automation reduces risks from manual misconfigurations.

---

## 📂 Basic Terraform Project Structure
```
projectname/
│-- provider.tf        # Provider configuration
│-- version.tf         # Terraform version
│-- backend.tf         # Remote backend setup
│-- main.tf            # Resources
│-- variables.tf       # Input variables
│-- terraform.tfvars   # Variable values
│-- outputs.tf         # Output values
│-- data.tf            # Data sources
│-- locals.tf          # Local variables
```

---

## 🔑 Important Terraform Commands
```bash
terraform -version
terraform init
terraform plan
terraform apply
terraform destroy
```

---

## ✅ Best Practices
- Use **remote state** for team collaboration.
- Keep **variables.tf** and **outputs.tf** organized.
- Use **modules** for reusable infrastructure.
- Always run `terraform plan` before `apply`.
- Version-control your Terraform configs.

---

