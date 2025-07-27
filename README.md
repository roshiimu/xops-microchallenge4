# XOps Microchallenge 4 - Terraform + Ansible Web App Deployment

## Overview
This project provisions an AWS EC2 instance using Terraform and configures it using Ansible to deploy a simple NGINX web server with a custom HTML page.

## Files
- `main.tf` - Terraform code to create EC2 instance, key pair, and security group.
- `inventory` - Ansible hosts file with EC2 public IP and SSH details.
- `site.yml` - Ansible playbook to install NGINX, start service, and copy custom web page.
- `index.html` - Custom HTML file served by NGINX.

## Setup Instructions

### 1. Provision Infrastructure
- Run `terraform init` to initialize Terraform.
- Run `terraform apply` to create EC2 instance and resources.

### 2. Configure EC2 with Ansible
- Update `inventory` file with your EC2 public IP.
- Run `ansible-playbook -i inventory site.yml` to install and configure NGINX.

### 3. Access Web Page
- Open browser and navigate to `http://<EC2_PUBLIC_IP>` to see the custom web page.

## Cleanup
- Run `terraform destroy` to delete all created AWS resources and avoid charges.

---

Thank you!
