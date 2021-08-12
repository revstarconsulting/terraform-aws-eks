resource "aws_eks_node_group" "this" {
  for_each = var.node_groups

  cluster_name  = aws_eks_cluster.this.name
  node_role_arn = aws_iam_role.node_group.arn
  subnet_ids    = var.subnet_ids

  node_group_name = each.value["node_group_name"]
  disk_size       = lookup(each.value, "disk_size", null)
  instance_types  = lookup(each.value, "instance_types", null)

  scaling_config {
    desired_size = lookup(each.value, "desired_capacity", 2)
    max_size     = lookup(each.value, "max_capacity", 2)
    min_size     = lookup(each.value, "min_capacity", 2)
  }


  launch_template {
    id      = aws_launch_template.this.id
    version = aws_launch_template.this.default_version
  }

  tags = merge({
    Name = var.node_group_name
    },
    local.common_tags
  )

  lifecycle {
    create_before_destroy = true
    ignore_changes        = [scaling_config[0].desired_size]
  }

  depends_on = [
    aws_iam_role.node_group,
    aws_iam_role.control_plane,
    aws_eks_cluster.this,
    module.node_sg[0].security_group_id,
    aws_iam_role_policy_attachment.node_policy,
    aws_iam_role_policy_attachment.ecr_policy,
    aws_iam_role_policy_attachment.cni_policy
  ]
}