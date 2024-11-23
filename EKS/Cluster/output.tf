# Outputs for the EKS Cluster details
output "eks_cluster_name" {
  description = "The name of the EKS cluster"
  value       = aws_eks_cluster.my_cluster.name
}

output "eks_cluster_arn" {
  description = "The ARN of the EKS cluster"
  value       = aws_eks_cluster.my_cluster.arn
}

output "eks_cluster_endpoint" {
  description = "The endpoint for the EKS cluster"
  value       = aws_eks_cluster.my_cluster.endpoint
}

output "eks_cluster_security_group" {
  description = "The security group ID for the EKS cluster"
  value       = aws_security_group.eks_cluster_sg.id
}

output "eks_cluster_role_arn" {
  description = "The IAM Role ARN associated with the EKS cluster"
  value       = aws_iam_role.eks_cluster_role.arn
}
