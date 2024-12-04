module "frontend_app" {
  source = "../../modules/app"

  app_name = "frontend-prod"
  region   = var.region
  services = [
    {
      name               = "web"
      instance_count     = var.instance_counts["production"].web
      instance_size_slug = var.instance_sizes["production"].web
      repo_url          = var.frontend_repo_url
      branch            = var.frontend_branch["production"]
    }
  ]
}

output "frontend_url" {
  description = "The URL of the frontend app"
  value       = module.frontend_app.app_url
}

output "frontend_id" {
  description = "The ID of the frontend app"
  value       = module.frontend_app.app_id
}
