resource "aws_kms_key" "this" {
  count                   = var.enable_encryption ? 1 : 0
  description             = "KMS key for EKS cluster ${var.cluster_name}"
  deletion_window_in_days = 10
  enable_key_rotation     = true
  tags                    = local.common_tags
}

resource "aws_kms_alias" "this" {
  count         = var.enable_encryption ? 1 : 0
  name          = "alias/eks-${var.cluster_name}-key"
  target_key_id = aws_kms_key.this[0].key_id
}
