output "environment" {
  description = "Current environment"
  value       = local.environment
}

output "region" {
  description = "Deployment region"
  value       = var.region
}

output "common_tags" {
  description = "Common tags applied to resources"
  value       = local.common_tags
}
