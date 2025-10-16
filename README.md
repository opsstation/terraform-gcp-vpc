# 🏗️ Terraform-google-vpc

[![OpsStation](https://img.shields.io/badge/Made%20by-OpsStation-blue?style=flat-square&logo=terraform)](https://www.opsstation.com)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Terraform](https://img.shields.io/badge/Terraform-1.6%2B-purple.svg?logo=terraform)](#)
[![CI](https://github.com/OpsStation/terraform-multicloud-labels/actions/workflows/ci.yml/badge.svg)](https://github.com/OpsStation/terraform-multicloud-labels/actions/workflows/ci.yml)

> 🌩️ **A production-grade, reusable GCP VPC module by [OpsStation](https://www.opsstation.com)**
> Designed for reliability, performance, and security — following GCP networking best practices.
---

## 🏢 About OpsStation

**OpsStation** delivers **Cloud & DevOps excellence** for modern teams:
- 🚀 **Infrastructure Automation** with Terraform, Ansible & Kubernetes
- 💰 **Cost Optimization** via scaling & right-sizing
- 🛡️ **Security & Compliance** baked into CI/CD pipelines
- ⚙️ **Fully Managed Operations** across GCP, Azure, and GCP

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
  network_enabled                           = true
  network_firewall_policy_enforcement_order = "AFTER_CLASSIC_FIREWALL"
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
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.13.3 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.50, < 7.6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 3.50, < 7.6.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_labels"></a> [labels](#module\_labels) | opsstation/labels/multicloud | 1.0.0 |

## Resources

| Name | Type |
|------|------|
| [google_compute_network.vpc_network](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |
| [google_compute_shared_vpc_host_project.host](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_shared_vpc_host_project) | resource |
| [google_compute_shared_vpc_service_project.service1](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_shared_vpc_service_project) | resource |
| [google_client_config.current](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_create_subnetworks"></a> [auto\_create\_subnetworks](#input\_auto\_create\_subnetworks) | (Optional) When set to true, the network is created in [auto\_subnet\_mode] and it will create a subnet for each region automatically across the 10.128.0.0/9 address range. | `bool` | `false` | no |
| <a name="input_delete_default_routes_on_create"></a> [delete\_default\_routes\_on\_create](#input\_delete\_default\_routes\_on\_create) | (Optional) If set to true, ensure that all routes within the network specified whose names begin with 'default-route' and with a next hop of 'default-internet-gateway' are deleted. | `bool` | `false` | no |
| <a name="input_deletion_policy"></a> [deletion\_policy](#input\_deletion\_policy) | Deletion policy for the shared VPC service project. Use 'ABANDON' to abandon instead of delete. | `string` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | (Optional) An optional description of the VPC. The resource must be recreated to modify this field.Default is ''. | `string` | `""` | no |
| <a name="input_enable_ula_internal_ipv6"></a> [enable\_ula\_internal\_ipv6](#input\_enable\_ula\_internal\_ipv6) | (Optional) Enable ULA internal ipv6 on this network. Enabling this feature will assign a /48 from google defined ULA prefix fd20::/20. | `bool` | `null` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources. | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| <a name="input_host_project_id"></a> [host\_project\_id](#input\_host\_project\_id) | Google Cloud Project ID | `string` | `null` | no |
| <a name="input_internal_ipv6_range"></a> [internal\_ipv6\_range](#input\_internal\_ipv6\_range) | (Optional) When enabling ula internal ipv6, caller optionally can specify the /48 range they want from the google defined ULA prefix fd20::/20. The input must be a valid /48 ULA IPv6 address and must be within the fd20::/20. Operation will fail if the speficied /48 is already in used by another resource. If the field is not speficied, then a /48 range will be randomly allocated from fd20::/20 and returned via this field. | `bool` | `null` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | Label order, e.g. sequence of application name and environment `name`,`environment`,'attribute' [`webserver`,`qa`,`devops`,`public`,] . | `list(any)` | <pre>[<br>  "name",<br>  "environment"<br>]</pre> | no |
| <a name="input_managedby"></a> [managedby](#input\_managedby) | ManagedBy,opsstation'. | `string` | `"opsstation'."` | no |
| <a name="input_mtu"></a> [mtu](#input\_mtu) | (Optional) Maximum Transmission Unit in bytes. The minimum value for this field is 1460 and the maximum value is 1500 bytes. Default is '1460'. | `number` | `1460` | no |
| <a name="input_name"></a> [name](#input\_name) | Name  (e.g. `app` or `cluster`). | `string` | `"OpsStation"` | no |
| <a name="input_network_enabled"></a> [network\_enabled](#input\_network\_enabled) | A boolean flag to enable/disable vpc. | `bool` | `true` | no |
| <a name="input_network_firewall_policy_enforcement_order"></a> [network\_firewall\_policy\_enforcement\_order](#input\_network\_firewall\_policy\_enforcement\_order) | (Optional) Set the order that Firewall Rules and Firewall Policies are evaluated. Default value is AFTER\_CLASSIC\_FIREWALL. Possible values are: BEFORE\_CLASSIC\_FIREWALL, AFTER\_CLASSIC\_FIREWALL | `string` | `"AFTER_CLASSIC_FIREWALL"` | no |
| <a name="input_repository"></a> [repository](#input\_repository) | Terraform current module repo | `string` | `""` | no |
| <a name="input_routing_mode"></a> [routing\_mode](#input\_routing\_mode) | - (Optional) The network-wide routing mode to use. If set to REGIONAL, this network's cloud routers will only advertise routes with subnetworks of this network in the same region as the router. | `string` | `"REGIONAL"` | no |
| <a name="input_service_project_id"></a> [service\_project\_id](#input\_service\_project\_id) | The ID of the project that will serve as a Shared VPC service project | `string` | `null` | no |
| <a name="input_shared_vpc_host_enabled"></a> [shared\_vpc\_host\_enabled](#input\_shared\_vpc\_host\_enabled) | Set to false to disable the creation of Google Compute Engine shared VPC host project. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gateway_ipv4"></a> [gateway\_ipv4](#output\_gateway\_ipv4) | The IPv4 address of the gateway |
| <a name="output_self_link"></a> [self\_link](#output\_self\_link) | The URI of the created resource |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The outputs of the created VPC. |
| <a name="output_vpc_name"></a> [vpc\_name](#output\_vpc\_name) | The outputs of the created VPC Name. |
<!-- END_TF_DOCS -->