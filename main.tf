terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

locals {
  environment = var.environment
  common_tags = {
    Environment = local.environment
    ManagedBy  = "terraform"
    Project    = "digital-ocean-apps"
  }
}
