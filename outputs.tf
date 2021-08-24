output "endpoint" {
  description = "EKS Cluster endpoint"
  value       = aws_eks_cluster.this.endpoint
}

output "kubeconfig_certificate_authority_data" {
  description = "EKS CA data"
  value       = aws_eks_cluster.this.certificate_authority.*.data
}

output "openid_connect_provider_arn" {
  description = "OpenID connect provider ARN for IRSA"
  value       = aws_iam_openid_connect_provider.this.*.arn
}

output "openid_connect_provider_url" {
  description = "OpenID connect provider URL for IRSA"
  value       = aws_iam_openid_connect_provider.this.*.url
}

output "oidc_issuer" {
  value       = aws_eks_cluster.this.identity[0].oidc[0].issuer
  description = "OIDC Issuer"
}
output "alb_ingress_role_arn" {
  value       = aws_iam_role.alb_ingress[0].arn
  description = "ALB Ingress controller IAM role ARN"
}

output "external_dns_role_arn" {
  value       = aws_iam_role.external_dns[0].arn
  description = "External DNS IAM Role ARN"
}

output "cluster_autoscaler_role_arn" {
  value       = aws_iam_role.cluster_autoscaler[0].arn
  description = "Cluster Autoscaler IAM Role ARN"
}