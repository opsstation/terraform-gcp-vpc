# 🏗️ Terraform-google-vpc

[![OpsStation](https://img.shields.io/badge/Made%20by-OpsStation-blue?style=flat-square&logo=terraform)](https://www.opsstation.com)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Terraform](https://img.shields.io/badge/Terraform-1.13%2B-purple.svg?logo=terraform)](#)
[![CI](https://github.com/OpsStation/terraform-gcp-vpc/actions/workflows/ci.yml/badge.svg)](https://github.com/OpsStation/terraform-gcp-vpc/actions/workflows/ci.yml)
[![Latest Release](https://img.shields.io/github/release/opsstation/terraform-gcp-vpc.svg)](https://github.com/opsstation/terraform-gcp-vpc/releases/latest)

> 🌩️ **A production-grade, reusable GCP VPC module by [OpsStation](https://www.opsstation.com)**
> Designed for reliability, performance, and security — following GCP networking best practices.
---

## 🏢 About OpsStation

**OpsStation** delivers **Cloud & DevOps excellence** for modern teams:
- 🚀 **Infrastructure Automation** with Terraform, Ansible & Kubernetes
- 💰 **Cost Optimization** via scaling & right-sizing
- 🛡️ **Security & Compliance** baked into CI/CD pipelines
- ⚙️ **Fully Managed Operations** across GCP, Azure, and AWS

> 💡 Need enterprise-grade DevOps automation?
> 👉 Visit [**www.opsstation.com**](https://www.opsstation.com) or email **hello@opsstation.com**

---
## 🌟 Features

- ✅ Creates **VPC networks** with full configuration options (custom MTU, routing mode, IPv6 support)
- ✅ Supports **auto or custom subnet modes** with conditional resource creation
- ✅ Optional **Shared VPC setup** with host and service project configuration
- ✅ Integrated with **Google Cloud IAM and project data** via `google_client_config`
- ✅ Configurable **deletion policy** for service project attachment
- ✅ Supports **custom labels** using [OpsStation multicloud module](https://registry.terraform.io/modules/opsstation/labels/multicloud/latest)
- ✅ Production-ready and modular — designed for reuse in multiple environments

---


## ⚙️ Usage Example
### 🧱 Basic VPC Example
```hcl
module "vpc" {
  source                                    = "opsstation/vpc/gcp"
  version                                   = "1.0.1"
  name                                      = "vpc"
  environment                               = "OpsStation"
  label_order                               = ["name", "environment"]
  mtu                                       = 1460
  routing_mode                              = "REGIONAL"
  network_firewall_policy_enforcement_order = "AFTER_CLASSIC_FIREWALL"
  network_enabled                           = true
  delete_default_routes_on_create           = false
}

```
### ☁️ Outputs (GCP VPC Module)

| Name                               | Description                                  |
|------------------------------------|----------------------------------------------|
| `vpc_id`                           | The ID of the created VPC network.           |
| `vpc_name`                         | The name of the created VPC network.         |
| `self_link`                        | The URI of the created VPC resource.         |
| `gateway_ipv4`                     | The default IPv4 gateway of the VPC.         |


---
### ☁️ Tag Normalization Rules (GCP)

| Cloud | Case      | Allowed Characters | Example                            |
|--------|-----------|------------------|------------------------------------|
| **GCP** | TitleCase | Any              | `Name`, `Environment`, `CostCenter` |

---

### 💙 Maintained by [OpsStation](https://www.opsstation.com)
> OpsStation — Simplifying Cloud, Securing Scale.
