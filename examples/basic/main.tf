terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

variable "region" {
  description = "AWS region for the provider."
  type        = string
  default     = "us-east-1"
}

provider "aws" {
  region = var.region
}

module "organizations" {
  source = "../.."

  feature_set = "ALL"

  organizational_units = ["workloads", "sandbox"]

  tags = {
    ManagedBy = "terraform"
  }
}

output "organization_id" {
  value = module.organizations.id
}
