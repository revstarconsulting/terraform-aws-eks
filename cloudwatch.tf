resource "aws_cloudwatch_log_group" "this" {
  name              = "/aws/eks/${var.cluster_name}/cluster"
  retention_in_days = var.environment == "prod" || var.environment == "production" ? 30 : 7

  #Ignore CMK warning
  #tfsec:ignore:AWS089
}