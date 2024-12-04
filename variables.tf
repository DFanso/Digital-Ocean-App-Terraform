# Provider Configuration
variable "do_token" {
  description = "Digital Ocean API Token"
  type        = string
  sensitive   = true
}

# Region Configuration
variable "region" {
  description = "Default region for resource deployment"
  type        = string
  default     = "nyc3"
}

# Environment Configuration
variable "environment" {
  description = "Environment name (e.g., staging, production)"
  type        = string
}

# Resource Configuration
variable "instance_sizes" {
  description = "Map of environment to instance size configurations"
  type = map(object({
    api = string
    web = string
  }))
  default = {
    staging = {
      api = "basic-xxs"
      web = "basic-xxs"
    }
    production = {
      api = "professional-xs"
      web = "professional-xs"
    }
  }
}

variable "instance_counts" {
  description = "Map of environment to instance count configurations"
  type = map(object({
    api = number
    web = number
  }))
  default = {
    staging = {
      api = 1
      web = 1
    }
    production = {
      api = 2
      web = 2
    }
  }
}

# Application Configuration
variable "backend_repo_url" {
  description = "URL of the backend repository"
  type        = string
}

variable "frontend_repo_url" {
  description = "URL of the frontend repository"
  type        = string
}

variable "backend_branch" {
  description = "Map of environment to backend branch names"
  type        = map(string)
  default = {
    staging    = "staging"
    production = "main"
  }
}

variable "frontend_branch" {
  description = "Map of environment to frontend branch names"
  type        = map(string)
  default = {
    staging    = "staging"
    production = "main"
  }
}
