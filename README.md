# Digital Ocean App Terraform

This repository contains a modular Terraform configuration for deploying multiple applications to Digital Ocean App Platform.

## Project Structure

```
.
├── modules/
│   └── app/                    # Reusable app module
│       ├── main.tf            # Main module configuration
│       ├── variables.tf       # Module variables
│       └── outputs.tf         # Module outputs
│
└── environments/
    ├── staging/              # Staging environment
    │   ├── main.tf          # Main configuration
    │   ├── variables.tf     # Environment variables
    │   └── terraform.tfvars.example
    └── production/          # Production environment
        ├── main.tf         # Main configuration
        └── variables.tf    # Environment variables
```

## Prerequisites

- Terraform installed (version >= 1.0.0)
- Digital Ocean account and API token
- Git repositories for your applications

## Usage

1. Clone this repository
2. Navigate to the desired environment directory:
   ```bash
   cd environments/staging
   ```
3. Copy the example tfvars file and fill in your values:
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```
4. Initialize Terraform:
   ```bash
   terraform init
   ```
5. Plan your changes:
   ```bash
   terraform plan
   ```
6. Apply the configuration:
   ```bash
   terraform apply
   ```

## Module Configuration

The app module supports the following variables:

- `app_name`: Name of your Digital Ocean app
- `region`: Region where the app will be deployed (default: "nyc")
- `services`: List of services to deploy, each containing:
  - `name`: Service name
  - `instance_count`: Number of instances
  - `instance_size_slug`: Instance size (e.g., "basic-xxs", "professional-xs")
  - `repo_url`: Git repository URL
  - `branch`: Git branch to deploy

## Environments

### Staging
- Configured with minimal resources
- Uses staging/development branches
- Single instance per service

### Production
- Configured with production-grade resources
- Uses main/production branches
- Multiple instances per service for high availability
