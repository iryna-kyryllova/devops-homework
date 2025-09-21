output "eks_cluster_name" {
  description = "Ім'я EKS кластера"
  value       = aws_eks_cluster.eks.name
}

output "eks_cluster_endpoint" {
  description = "EKS кластер ендпоінт"
  value       = aws_eks_cluster.eks.endpoint
}

output "eks_node_role_arn" {
  description = "ARN ролі вузлів EKS"
  value       = aws_iam_role.nodes.arn
}

output "oidc_provider_arn" {
  description = "ARN провайдера OIDC для EKS"
  value       = aws_iam_openid_connect_provider.oidc.arn
}

output "oidc_provider_url" {
  description = "URL провайдера OIDC для EKS"
  value       = aws_iam_openid_connect_provider.oidc.url
}

