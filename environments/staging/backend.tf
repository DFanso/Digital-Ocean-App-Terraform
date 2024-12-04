module "backend_app" {
  source = "../../modules/app"

  app_name = "backend-staging"
  region   = var.region
  services = [
    {
      name               = "api"
      instance_count     = var.instance_counts["staging"].api
      instance_size_slug = var.instance_sizes["staging"].api
      repo_url          = var.backend_repo_url
      branch            = var.backend_branch["staging"]
    }
  ]
}

output "backend_url" {
  description = "The URL of the backend app"
  value       = module.backend_app.app_url
}

output "backend_id" {
  description = "The ID of the backend app"
  value       = module.backend_app.app_id
}
