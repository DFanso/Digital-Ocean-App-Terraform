output "app_url" {
  description = "The URL of the deployed app"
  value       = digitalocean_app.app.default_ingress
}

output "app_id" {
  description = "The ID of the deployed app"
  value       = digitalocean_app.app.id
}

output "updated_at" {
  description = "Last update timestamp"
  value       = digitalocean_app.app.updated_at
}
