# 🏗️ {{ name }}

{% for badge in badges %}
[![{{ badge.name }}]({{ badge.image }})]({{ badge.url }})
{% endfor %}

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

## ⚙️ Prerequisites

{% for prereq in prerequisites %}
- [{{ prereq.name }}]({{ prereq.url }}) version {{ prereq.version }}
  {% endfor %}

---

## ⚙️ Providers

{% for provider in providers %}
- [{{ provider.name }}]({{ provider.url }}) version {{ provider.version }}
  {% endfor %}

---

## ⚙️ Usage Example

{{ usage }}

---

### 💙 Maintained by [OpsStation](https://www.opsstation.com)
> OpsStation — Simplifying Cloud, Securing Scale.
