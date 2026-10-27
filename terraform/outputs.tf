output "cluster_name" {
  value = module.eks.cluster_name
}

output "configure_kubectl" {
  value = "aws eks update-kubeconfig --name ${module.eks.cluster_name} --region ${var.region}"
}

output "github_actions_role_arn" {
  description = "Save this as the GitHub secret AWS_ROLE_ARN"
  value       = try(aws_iam_role.github_actions[0].arn, "")
}
