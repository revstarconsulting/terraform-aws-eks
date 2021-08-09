resource "aws_eks_addon" "this" {
  count = var.enable_addons ? length(var.addons) : 0

  cluster_name      = aws_eks_cluster.this.name
  resolve_conflicts = "OVERWRITE"

  addon_name    = lookup(var.addons[count.index], "name")
  addon_version = lookup(var.addons[count.index], "version")

  tags = local.common_tags
}