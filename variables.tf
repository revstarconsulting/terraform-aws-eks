variable "cluster_name" {
  description = "EKS Cluster name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for EKS Cluster"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}
variable "cluster_version" {
  description = "EKS Cluster Version"
  type        = string
  default     = "1.20"
}

variable "control_plane_tags" {
  description = "Tags applied on Control Plane"
  type        = map(string)
  default     = {}
}

variable "private_endpoint_enabled" {
  description = "Whether or not to enable private endpoint"
  type        = bool
  default     = false
}

variable "public_endpoint_enabled" {
  description = "Whether or not to enable public endpoint"
  type        = bool
  default     = true
}

variable "public_access_cidr_blocks" {
  description = "List of CIDR blocks to be whitelisted for public access"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "control_plane_security_groups" {
  description = "List of security group ids to be attached to control plane"
  type        = list(string)
  default     = []
}

variable "control_plane_subnet_ids" {
  description = "List of subnet ids to be provision the control plane in"
  type        = list(string)
  default     = []
}

variable "control_plane_role_name" {
  description = "IAM role name for the control plane"
  type        = string
}

variable "control_plane_assume_role_policy" {
  description = "Custom assume role policy to be attached with control plane IAM role"
  type        = string
  default     = ""
}

variable "custom_control_plane_role_policies" {
  description = "List of ARNs of custom managed policies to be applied to IAM Role"
  type        = list(string)
  default     = []
}

variable "cluster_log_types" {
  description = "List of cluster log types to be enabled."
  type        = list(string)
  default     = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
}

variable "enable_irsa" {
  description = "Whether or not to enable IAM role for Service Accounts"
  type        = bool
  default     = false
}

variable "disk_size" {
  description = "Disk size (in GBs) to attach with EKS nodes"
  type        = number
  default     = 100
}

variable "disk_type" {
  description = "EBS volume type"
  type        = string
  default     = "gp3"
}

variable "instance_type" {
  description = "Instance type to be configured in launch template"
  type        = string
  default     = "t3.large"
}

variable "instance_types" {
  description = "List of instance types outside launch template."
  type        = list(string)
  default     = []
}
variable "node_security_groups" {
  description = "List of Security Group IDs to configure in Launch Template"
  type        = list(string)
  default     = []
}

variable "launch_template_name" {
  description = "Launch template name"
  type        = string
  default     = "eks-launch-template"
}
variable "node_group_role_name" {
  description = "IAM role name for the node groups"
  type        = string
}

variable "ssh_key_name" {
  description = "SSH Key name to be associated with the instances"
  type        = string
  default     = ""
}
variable "node_group_assume_role_policy" {
  description = "Custom assume role policy to be attached with node group IAM role"
  type        = string
  default     = ""
}

variable "custom_node_role_policies" {
  description = "List of ARNs of custom managed policies to be applied to IAM Role"
  type        = list(string)
  default     = []
}

variable "node_groups" {
  description = "Map of node groups to be created"
  type        = any
  default     = {}
}

variable "node_group_name" {
  type        = string
  description = "The name of the cluster node group. Defaults to <cluster_name>-<random value>"
  default     = null
}

variable "subnet_ids" {
  description = "A list of subnet IDs to launch resources in"
  type        = list(string)
}

#AddOns

variable "enable_addons" {
  description = "Whether or not to enable addons"
  type        = bool
  default     = false
}

variable "addons" {
  description = "List of addons to be managed. Valid values are `coredns`, `kube-proxy` and `vpc-cni`. Only valid if `enable_addons` is set to true"
  type        = any
  default     = []
}

variable "helm_charts" {
  description = "List of helm charts to be deployed"
  type        = any
  default     = {}
}

variable "additional_settings" {
  description = "Map of additional settings for helm deployments"
  type        = list(map(string))
  default     = []
}

variable "enable_encryption" {
  description = "Set to true if secrets need to be encrypted"
  type        = bool
  default     = true
}
variable "cluster_encryption_config" {
  description = "Secrets encryption configuration"
  type        = any
  default     = []
}

variable "tag_application" {
  description = "Application tag"
  type        = string

}

variable "tag_team" {
  description = "Team tag"
  type        = string

}

variable "environment" {
  description = "Provide appropriate environment name"
  type        = string

  validation {
    condition = contains([
      "dev",
      "development",
      "uat",
      "production",
      "prod",
      "sandbox",
      "transit",
      "vault",
      "shared"
    ], var.environment)

    error_message = "The environment value is not valid. Valid values are dev/development/uat/prod/production/sandbox/transit/vault/shared."
  }
}

locals {
  common_tags = {
    Application = var.tag_application
    Team        = var.tag_team
    environment = var.environment
  }
}