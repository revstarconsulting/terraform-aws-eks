

This module creates EKS Control Plane, Managed NodeGroups and Fargate Profiles

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.22.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.6.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.12.1 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 3.4.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cluster_sg"></a> [cluster\_sg](#module\_cluster\_sg) | github.com/revstarconsulting/terraform-aws-security-group | v1.0.0 |
| <a name="module_node_sg"></a> [node\_sg](#module\_node\_sg) | github.com/revstarconsulting/terraform-aws-security-group | v1.0.0 |

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_eks_addon.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_addon) | resource |
| [aws_eks_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster) | resource |
| [aws_eks_node_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_iam_openid_connect_provider.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_policy.alb_ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.cluster_autoscaler](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.external_dns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.alb_ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.cluster_autoscaler](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.control_plane](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.external_dns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.node_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.alb_ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.cluster_autoscaler](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.cluster_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.cni_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ecr_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.external_dns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.logs_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.node_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_kms_alias.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_launch_template.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |
| [helm_release.this](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_config_map.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/config_map) | resource |
| [kubernetes_namespace_v1.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace_v1) | resource |
| [kubernetes_service_account_v1.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account_v1) | resource |
| [aws_eks_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster) | data source |
| [aws_eks_cluster_auth.cluster-auth](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster_auth) | data source |
| [aws_iam_policy_document.alb_ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.alb_ingress_assume](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.app_irsa](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.cluster_autoscaler](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.cluster_autoscaler_assume](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.control_plane_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.external_dns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.external_dns_irsa](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.node_group_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [tls_certificate.this](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/data-sources/certificate) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_settings"></a> [additional\_settings](#input\_additional\_settings) | Map of additional settings for helm deployments | `list(map(string))` | `[]` | no |
| <a name="input_addons"></a> [addons](#input\_addons) | List of addons to be managed. Valid values are `coredns`, `kube-proxy` and `vpc-cni`. Only valid if `enable_addons` is set to true | `any` | `[]` | no |
| <a name="input_alb_ingress_enabled"></a> [alb\_ingress\_enabled](#input\_alb\_ingress\_enabled) | Whether or not to install ALB Load balancer controller | `bool` | `true` | no |
| <a name="input_app_logs_enabled"></a> [app\_logs\_enabled](#input\_app\_logs\_enabled) | Whether or not to send app logs to CloudWatch | `bool` | `true` | no |
| <a name="input_app_namespace"></a> [app\_namespace](#input\_app\_namespace) | k8s namespace for application | `string` | n/a | yes |
| <a name="input_app_role_policy"></a> [app\_role\_policy](#input\_app\_role\_policy) | IAM policy to be attached with app IAM role | `string` | n/a | yes |
| <a name="input_app_service_account"></a> [app\_service\_account](#input\_app\_service\_account) | k8s service account | `string` | n/a | yes |
| <a name="input_ca_enabled"></a> [ca\_enabled](#input\_ca\_enabled) | Whether or not to install Cluster Autoscaler | `bool` | `true` | no |
| <a name="input_cluster_encryption_config"></a> [cluster\_encryption\_config](#input\_cluster\_encryption\_config) | Secrets encryption configuration | `any` | `[]` | no |
| <a name="input_cluster_log_types"></a> [cluster\_log\_types](#input\_cluster\_log\_types) | List of cluster log types to be enabled. | `list(string)` | <pre>[<br>  "api",<br>  "audit",<br>  "authenticator",<br>  "controllerManager",<br>  "scheduler"<br>]</pre> | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | EKS Cluster name | `string` | n/a | yes |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | EKS Cluster Version | `string` | `"1.20"` | no |
| <a name="input_control_plane_assume_role_policy"></a> [control\_plane\_assume\_role\_policy](#input\_control\_plane\_assume\_role\_policy) | Custom assume role policy to be attached with control plane IAM role | `string` | `""` | no |
| <a name="input_control_plane_role_name"></a> [control\_plane\_role\_name](#input\_control\_plane\_role\_name) | IAM role name for the control plane | `string` | n/a | yes |
| <a name="input_control_plane_security_groups"></a> [control\_plane\_security\_groups](#input\_control\_plane\_security\_groups) | List of security group ids to be attached to control plane | `list(string)` | `[]` | no |
| <a name="input_control_plane_subnet_ids"></a> [control\_plane\_subnet\_ids](#input\_control\_plane\_subnet\_ids) | List of subnet ids to be provision the control plane in | `list(string)` | `[]` | no |
| <a name="input_control_plane_tags"></a> [control\_plane\_tags](#input\_control\_plane\_tags) | Tags applied on Control Plane | `map(string)` | `{}` | no |
| <a name="input_custom_control_plane_role_policies"></a> [custom\_control\_plane\_role\_policies](#input\_custom\_control\_plane\_role\_policies) | List of ARNs of custom managed policies to be applied to IAM Role | `list(string)` | `[]` | no |
| <a name="input_custom_node_role_policies"></a> [custom\_node\_role\_policies](#input\_custom\_node\_role\_policies) | List of ARNs of custom managed policies to be applied to IAM Role | `list(string)` | `[]` | no |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | Disk size (in GBs) to attach with EKS nodes | `number` | `100` | no |
| <a name="input_disk_type"></a> [disk\_type](#input\_disk\_type) | EBS volume type | `string` | `"gp3"` | no |
| <a name="input_enable_addons"></a> [enable\_addons](#input\_enable\_addons) | Whether or not to enable addons | `bool` | `false` | no |
| <a name="input_enable_custom_configmap"></a> [enable\_custom\_configmap](#input\_enable\_custom\_configmap) | Enable it to configure additional IAM roles in aws-auth configmap | `bool` | `false` | no |
| <a name="input_enable_encryption"></a> [enable\_encryption](#input\_enable\_encryption) | Set to true if secrets need to be encrypted | `bool` | `true` | no |
| <a name="input_enable_irsa"></a> [enable\_irsa](#input\_enable\_irsa) | Whether or not to enable IAM role for Service Accounts | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Provide appropriate environment name | `string` | n/a | yes |
| <a name="input_external_dns_enabled"></a> [external\_dns\_enabled](#input\_external\_dns\_enabled) | Whether or not to install external dns | `bool` | `true` | no |
| <a name="input_helm_charts"></a> [helm\_charts](#input\_helm\_charts) | List of helm charts to be deployed | `any` | `{}` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Instance type to be configured in launch template | `string` | `"t3.large"` | no |
| <a name="input_instance_types"></a> [instance\_types](#input\_instance\_types) | List of instance types outside launch template. | `list(string)` | `[]` | no |
| <a name="input_launch_template_name"></a> [launch\_template\_name](#input\_launch\_template\_name) | Launch template name | `string` | `"eks-launch-template"` | no |
| <a name="input_map_accounts"></a> [map\_accounts](#input\_map\_accounts) | Additional AWS account numbers to add to the aws-auth configmap. | `list(string)` | `[]` | no |
| <a name="input_map_roles"></a> [map\_roles](#input\_map\_roles) | Additional IAM roles to add to the aws-auth configmap. | <pre>list(object({<br>    rolearn  = string<br>    username = string<br>    groups   = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_map_users"></a> [map\_users](#input\_map\_users) | Additional IAM users to add to the aws-auth configmap. | <pre>list(object({<br>    userarn  = string<br>    username = string<br>    groups   = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_namespaces"></a> [namespaces](#input\_namespaces) | List of namespaces | `list(any)` | `[]` | no |
| <a name="input_node_group_assume_role_policy"></a> [node\_group\_assume\_role\_policy](#input\_node\_group\_assume\_role\_policy) | Custom assume role policy to be attached with node group IAM role | `string` | `""` | no |
| <a name="input_node_group_name"></a> [node\_group\_name](#input\_node\_group\_name) | The name of the cluster node group. Defaults to <cluster\_name>-<random value> | `string` | `null` | no |
| <a name="input_node_group_role_name"></a> [node\_group\_role\_name](#input\_node\_group\_role\_name) | IAM role name for the node groups | `string` | n/a | yes |
| <a name="input_node_groups"></a> [node\_groups](#input\_node\_groups) | Map of node groups to be created | `any` | `{}` | no |
| <a name="input_node_security_groups"></a> [node\_security\_groups](#input\_node\_security\_groups) | List of Security Group IDs to configure in Launch Template | `list(string)` | `[]` | no |
| <a name="input_node_subnet_ids"></a> [node\_subnet\_ids](#input\_node\_subnet\_ids) | A list of subnet IDs to launch worker nodes in. If blank, will use the subnet\_ids variable | `list(string)` | `[]` | no |
| <a name="input_private_endpoint_enabled"></a> [private\_endpoint\_enabled](#input\_private\_endpoint\_enabled) | Whether or not to enable private endpoint | `bool` | `false` | no |
| <a name="input_public_access_cidr_blocks"></a> [public\_access\_cidr\_blocks](#input\_public\_access\_cidr\_blocks) | List of CIDR blocks to be whitelisted for public access | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_public_endpoint_enabled"></a> [public\_endpoint\_enabled](#input\_public\_endpoint\_enabled) | Whether or not to enable public endpoint | `bool` | `true` | no |
| <a name="input_service_accounts"></a> [service\_accounts](#input\_service\_accounts) | List of Service Accounts | `list(any)` | `[]` | no |
| <a name="input_ssh_key_name"></a> [ssh\_key\_name](#input\_ssh\_key\_name) | SSH Key name to be associated with the instances | `string` | `""` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | A list of subnet IDs to launch resources in | `list(string)` | n/a | yes |
| <a name="input_tag_application"></a> [tag\_application](#input\_tag\_application) | Application tag | `string` | n/a | yes |
| <a name="input_tag_team"></a> [tag\_team](#input\_tag\_team) | Team tag | `string` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | VPC CIDR block | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID for EKS Cluster | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_ingress_role_arn"></a> [alb\_ingress\_role\_arn](#output\_alb\_ingress\_role\_arn) | ALB Ingress controller IAM role ARN |
| <a name="output_cluster_autoscaler_role_arn"></a> [cluster\_autoscaler\_role\_arn](#output\_cluster\_autoscaler\_role\_arn) | Cluster Autoscaler IAM Role ARN |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | EKS Cluster endpoint |
| <a name="output_external_dns_role_arn"></a> [external\_dns\_role\_arn](#output\_external\_dns\_role\_arn) | External DNS IAM Role ARN |
| <a name="output_kubeconfig_certificate_authority_data"></a> [kubeconfig\_certificate\_authority\_data](#output\_kubeconfig\_certificate\_authority\_data) | EKS CA data |
| <a name="output_oidc_issuer"></a> [oidc\_issuer](#output\_oidc\_issuer) | OIDC Issuer |
| <a name="output_openid_connect_provider_arn"></a> [openid\_connect\_provider\_arn](#output\_openid\_connect\_provider\_arn) | OpenID connect provider ARN for IRSA |
| <a name="output_openid_connect_provider_url"></a> [openid\_connect\_provider\_url](#output\_openid\_connect\_provider\_url) | OpenID connect provider URL for IRSA |
