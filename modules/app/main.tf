resource "digitalocean_app" "app" {
  spec {
    name = var.app_name
    region = var.region

    dynamic "service" {
      for_each = var.services
      content {
        name               = service.value.name
        instance_count     = service.value.instance_count
        instance_size_slug = service.value.instance_size_slug

        git {
          repo_clone_url = service.value.repo_url
          branch         = service.value.branch
        }
      }
    }
  }
}
