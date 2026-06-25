# DevOps CI/CD Project

## Project Overview

This project demonstrates a complete DevOps workflow using:

- Git & GitHub
- Docker
- Jenkins
- Kubernetes (K3s)
- AWS EC2

## Architecture

```text
GitHub
   ↓
Jenkins
   ↓
Docker Build
   ↓
Docker Image
   ↓
Kubernetes (K3s)
   ↓
Service
   ↓
Ingress
   ↓
Application

Project Structure
devops-cicd-project/
├── app.py
├── requirements.txt
├── Dockerfile
├── Jenkinsfile
├── README.md
│
├── kubernetes/
│   ├── deployment.yaml
│   ├── service.yaml
│   ├── ingress.yaml
│   ├── configmap.yaml
│   └── secret.yaml
│
├── monitoring/
│   └── prometheus.yml
│
└── terraform/
    ├── provider.tf
    └── ec2.tf
