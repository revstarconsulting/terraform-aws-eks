locals {

  map_worker_roles = [
    {
      rolearn : aws_iam_role.node_group.arn
      username : "system:node:{{EC2PrivateDNSName}}"
      groups : [
        "system:bootstrappers",
        "system:nodes"
      ]
    }
  ]
}

resource "kubernetes_config_map" "this" {
  count = var.enable_custom_configmap ? 1 : 0
  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
  }

  data = {

    mapRoles    = yamlencode(distinct(concat(local.map_worker_roles, var.map_roles)))
    mapUsers    = yamlencode(var.map_users)
    mapAccounts = yamlencode(var.map_accounts)
  }

}

resource "kubernetes_namespace_v1" "this" {
  for_each = { for k, v in var.namespaces : k => v }

  metadata {
    name = each.value.name
    annotations = {
      for annotation in each.value.annotations : annotation.label => annotation.value
    }
    labels = {
      for label in each.value.labels : label.label => label.value
    }

  }
}

resource "kubernetes_service_account_v1" "this" {
  for_each = { for k, v in var.service_accounts : k => v }
  metadata {
    name      = each.value.name
    namespace = each.value.namespace
    annotations = {
      for annotation in each.value.annotations : annotation.label => annotation.value
    }
  }
}
