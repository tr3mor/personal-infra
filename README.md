# Personal Infrastructure

A GitOps-based personal infrastructure setup that I maintain in my free time. This repo manages my cloud resources, local Kubernetes cluster, and various tools I use for personal projects.

#### What this does

This repository implements a GitOps approach to manage my personal infrastructure across different platforms.

Implemented using:
- **[Terraform Cloud](https://cloud.hashicorp.com/products/terraform)** - manages cloud resources automatically
- **[ArgoCD](https://argo-cd.readthedocs.io/en/stable/)** - handles Kubernetes deployments
- **[GitHub Actions](https://github.com/features/actions)** - runs tests and checks
- **[Terratest](https://terratest.gruntwork.io/)** - tests infrastructure code

It currently manages:
- Terraform Cloud workspaces and settings
- Grafana Cloud monitoring stack
- GitHub repositories (including this one)
- Local Kubernetes cluster with monitoring tools

## Repository structure

```
├── terraform/              # Cloud infrastructure definitions
│   ├── github/             # GitHub repo management
│   ├── grafana-cloud/      # Grafana Cloud setup
│   └── tf-cloud/           # Terraform Cloud workspaces
├── terraform-modules/      # Reusable modules
├── k8s/                    # Kubernetes manifests
│   ├── local-cluster/      # Local cluster apps
│   └── manifests/          # Application definitions
└── .github/workflows/      # CI/CD pipelines
```

## Local cluster setup

I run a local Kubernetes cluster with a full monitoring stack to have a playground for work tasks:

**Core infrastructure:**
- ArgoCD for GitOps deployments
- NGINX Ingress Controller
- PostgreSQL for application data

**Monitoring stack:**
- Prometheus for metrics collection
- Grafana for dashboards and visualization
- Loki for log aggregation
- AlertManager for alert routing

**Custom tools:**
- PromLens - PromQL query builder
- AM Routing Tree - AlertManager config visualizer

Everything is accessible via `.localdev` domains when running locally.

## How it works

### Infrastructure automation
All cloud resources are managed through Terraform Cloud workspaces. When Terraform code is changed, it automatically plans and applies changes. Each workspace is configured for a specific purpose:
- `github-repos` - manages my GitHub repositories
- `grafana-cloud-stack` - provisions Grafana Cloud resources
- `tf-cloud-workspaces` - manages Terraform Cloud itself

### Kubernetes GitOps
ArgoCD watches this repository and automatically deploys applications to my local cluster. Applications are organized with sync waves to ensure proper startup order - infrastructure components deploy first, then monitoring tools, then custom applications.

### Testing and quality
GitHub Actions run various checks:
- Go tests for Terraform modules (using Terratest)
- golangci-lint for code quality
- Terraform validation and formatting
- Security scanning with TruffleHog
- Dependabot for automated dependency upgrades

## Key features

**GitOps everywhere:** Both cloud infrastructure and Kubernetes applications follow GitOps principles. Git is the source of truth, everything else is automated.

**Comprehensive monitoring:** Full observability stack with metrics, logs, and alerting for my local cluster, which speed up troubleshooting.

**Modular design:** Terraform modules make it easy to create consistent resources. The same patterns work across different projects.

**Automated testing:** Infrastructure changes are tested before deployment. Terratest validates that resources are created correctly.

**Security-first:** Automated secret scanning, dependency updates, and security policies.

## Getting started

If you want to run something similar:

1. **Set up Terraform Cloud** - create an organization and get an API token
2. **Configure GitHub integration** - connect Terraform Cloud to your repository
3. **Deploy ArgoCD** - install it in your Kubernetes cluster
4. **Set up monitoring** - deploy Prometheus, Grafana, and friends

The `.github/workflows/` contain all the automation. Adapt the Terraform code in `terraform/` for your own cloud resources.

## Tech stack

- **Go 1.24** - for testing and tooling
- **Terraform** - infrastructure as code
- **Kubernetes** - container orchestration  
- **ArgoCD** - GitOps continuous delivery
- **Prometheus/Grafana** - monitoring and observability
- **GitHub Actions** - CI/CD automation

---

This is a personal project I work on in my spare time to learn new technologies and practice infrastructure automation. Feel free to explore the code and adapt anything useful for your own projects.