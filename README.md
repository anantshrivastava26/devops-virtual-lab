# End-to-End DevOps CI/CD Pipeline

This project demonstrates a complete **DevOps automation pipeline** where infrastructure is provisioned, servers are configured, applications are containerized, and deployments are automated using modern DevOps tools.

The pipeline integrates **Git, Terraform, Ansible, Docker, Kubernetes, and GitHub Actions** to achieve fully automated deployment.

---

# Architecture Overview

The DevOps workflow follows this sequence:

```
Developer
   │
   │ git push
   ▼
GitHub Repository
   │
   ▼
GitHub Actions CI/CD Pipeline
   │
   ├── Terraform → Creates AWS EC2 Infrastructure
   │
   ├── Ansible → Configures Server Environment
   │
   ├── Docker → Builds Application Container
   │
   ▼
Kubernetes Cluster
   │
   ▼
Application Deployment
```

---

# DevOps Tools Used

| Tool           | Purpose                  |
| -------------- | ------------------------ |
| Git            | Version control          |
| GitHub         | Code hosting and CI/CD   |
| GitHub Actions | CI/CD automation         |
| Terraform      | Infrastructure as Code   |
| Ansible        | Configuration management |
| Docker         | Containerization         |
| Kubernetes     | Container orchestration  |
| AWS EC2        | Cloud infrastructure     |

---

# Project Directory Structure

```
devops-virtual-lab/
│
├── app/
│   ├── index.html
│   └── Dockerfile
│
├── terraform/
│   ├── main.tf
│   └── .terraform.lock.hcl
│
├── ansible/
│   ├── inventory.ini
│   └── setup.yml
│
├── k8s/
│   ├── deployment.yml
│   └── service.yml
│
└── .github/
    └── workflows/
        └── cicd.yml
```

---

# Application

The application is a simple **Nginx-based web page** deployed using Docker and Kubernetes.

Example page:

```
DevOps CI/CD Virtual Lab
Deployed using Git, Terraform, Ansible, Docker & Kubernetes
```

---

# Step-by-Step Implementation

## 1. Clone Repository

```
git clone https://github.com/anantshrivastava26/devops-virtual-lab.git
cd devops-virtual-lab
```

---

## 2. Build Docker Image

```
docker build -t devops-lab-app ./app
```

Run container:

```
docker run -d -p 8080:80 devops-lab-app
```

---

## 3. Infrastructure Provisioning with Terraform

Navigate to Terraform folder:

```
cd terraform
terraform init
terraform plan
terraform apply
```

Terraform automatically creates an **AWS EC2 instance**.

---

## 4. Configure Server using Ansible

Update `inventory.ini` with the EC2 public IP.

Run playbook:

```
ansible-playbook -i inventory.ini setup.yml
```

Ansible installs and starts **Docker on the server**.

---

## 5. Deploy Application on Kubernetes

Start Kubernetes cluster:

```
minikube start --driver=docker
```

Build image inside Minikube:

```
eval $(minikube docker-env)
docker build -t devops-lab-app ./app
```

Deploy:

```
kubectl apply -f k8s/deployment.yml
kubectl apply -f k8s/service.yml
```

Check deployment:

```
kubectl get pods
kubectl get svc
```

Access application using the NodePort.

---

# CI/CD Automation using GitHub Actions

Whenever code is pushed to the **main branch**, GitHub Actions automatically:

1. Pulls the latest code
2. Builds the Docker image
3. Deploys the application to Kubernetes

Workflow file:

```
.github/workflows/cicd.yml
```

---

# Security Best Practices

Sensitive files are excluded using `.gitignore`.

Ignored files include:

```
.terraform/
*.tfstate
*.pem
```

This prevents private keys and large provider binaries from being committed.

---

# Result

The project successfully demonstrates a **fully automated DevOps pipeline** where:

* Infrastructure is created automatically
* Servers are configured automatically
* Applications are containerized
* Deployments are orchestrated using Kubernetes
* CI/CD pipelines trigger deployments automatically

---

# Learning Outcomes

This project demonstrates practical skills in:

* Infrastructure as Code
* Configuration Management
* Containerization
* Kubernetes Deployment
* CI/CD Pipeline Automation
* Cloud Infrastructure Management

---

# Author

**Anant Shrivastava**

GitHub:
https://github.com/anantshrivastava26
