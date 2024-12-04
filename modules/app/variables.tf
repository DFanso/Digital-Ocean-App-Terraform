variable "app_name" {
  description = "Name of the Digital Ocean App"
  type        = string
}

variable "region" {
  description = "Region where the app will be deployed"
  type        = string
  default     = "nyc"
}

variable "services" {
  description = "List of services to deploy in the app"
  type = list(object({
    name               = string
    instance_count     = number
    instance_size_slug = string
    repo_url          = string
    branch            = string
  }))
}
