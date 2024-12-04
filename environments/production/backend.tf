module "backend_app" {
  source = "../../modules/app"

  app_name = "backend-prod"
  region   = var.region
  services = [
    {
      name               = "api"
      instance_count     = var.instance_counts["production"].api
      instance_size_slug = var.instance_sizes["production"].api
      repo_url          = var.backend_repo_url
      branch            = var.backend_branch["production"]
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
