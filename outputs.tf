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