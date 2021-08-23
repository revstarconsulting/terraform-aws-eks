
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
      name  = set.value["name"]
      value = set.value["value"]
    }
  }

  depends_on = [
    aws_eks_cluster.this,
    aws_eks_node_group.this
  ]
}

