locals {
  landing_zone_manifest = {
    accessManagement = {
      enabled = true
    }

    backup = {
      enabled = var.backup_enabled
    }

    centralizedLogging = {
      enabled = var.centralized_logging_enabled
    }

    config = {
      enabled = var.config_enabled
    }

    securityRoles = {
      enabled = var.security_roles_enabled
    }

    governedRegions = var.governed_regions
  }
}

resource "aws_controltower_landing_zone" "this" {
  manifest_json = jsonencode(local.landing_zone_manifest)

  version = var.landing_zone_version

  remediation_types = [
    "INHERITANCE_DRIFT"
  ]
}