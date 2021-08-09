resource "aws_eks_cluster" "this" {
  name     = var.cluster_name
  version  = var.cluster_version
  role_arn = aws_iam_role.control_plane.arn
  tags = merge(
    local.common_tags,
    var.control_plane_tags
  )

  enabled_cluster_log_types = var.cluster_log_types #tfsec:ignore:AWS067
  vpc_config {

    endpoint_private_access = var.private_endpoint_enabled
    endpoint_public_access  = var.public_endpoint_enabled   #tfsec:ignore:AWS069 
    public_access_cidrs     = var.public_access_cidr_blocks #tfsec:ignore:AWS068

    security_group_ids = length(var.control_plane_security_groups) > 0 ? var.control_plane_security_groups : [module.cluster_sg[0].security_group_id]
    subnet_ids         = var.subnet_ids
  }



  depends_on = [
    aws_iam_role.control_plane,
    aws_iam_role_policy_attachment.cluster_policy,
    module.cluster_sg[0].security_group_id
  ]



  dynamic "encryption_config" {
    for_each = toset(var.cluster_encryption_config)

    content {
      provider {
        key_arn = lookup(encryption_config.value, "provider_key_arn", aws_kms_key.this[0].arn) #tfsec:ignore:AWS066
      }
      resources = encryption_config.value["resources"]
    }
  }

  /*
  encryption_config {
    provider {
      key_arn = var.enable_encryption ? aws_kms_key.this[0].arn : null
    }
    resources = ["secrets"]
  }
  */

}