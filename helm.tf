
resource "helm_release" "this" {
  for_each = var.helm_charts

  name       = each.value["name"]
  repository = each.value["repository"]
  chart      = each.value["chart_name"]
  version    = lookup(each.value, "chart_version", null)

  namespace        = lookup(each.value, "namespace", "kube-system")
  values           = each.value["filename"] != "" ? [file(each.value["filename"])] : []
  create_namespace = true
  dynamic "set" {
    for_each = var.additional_settings
    content {
      name  = set.key
      value = set.value
    }
  }

  depends_on = [
    aws_eks_cluster.this,
    aws_eks_node_group.this
  ]
}

#ALB
/*
resource "helm_release" "alb_ingress" {
  count      = var.alb_ingress_enabled ? 1 : 0
  name       = "alb-controller"
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  namespace  = "kube-system"

  set {
    name  = "clusterName"
    value = var.cluster_name
  }

  set {
    name  = "rbac.create"
    value = "true"
  }

  set {
    name  = "rbac.serviceAccount.create"
    value = "true"
  }

  set {
    name  = "rbac.serviceAccountAnnotations.eks\\.amazonaws\\.com/role-arn"
    value = aws_iam_role.alb_ingress[0].arn
  }

  dynamic "set" {
    for_each = var.additional_settings

    content {
      name  = set.key
      value = set.value
    }
  }
}
*/