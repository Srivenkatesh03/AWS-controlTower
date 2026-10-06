variable "landing_zone_version" {
  description = "AWS Control Tower landing zone version"
  type        = string

  validation {
    condition     = length(trimspace(var.landing_zone_version)) > 0
    error_message = "landing_zone_version must not be empty."
  }
}

variable "governed_regions" {
  description = "AWS regions governed by Control Tower"
  type        = list(string)

  validation {
    condition = length(var.governed_regions) > 0 && alltrue([
      for region in var.governed_regions : can(regex("^[a-z]{2}-[a-z]+-[0-9]+$", region))
    ])
    error_message = "governed_regions must include at least one valid AWS region name."
  }
}

variable "centralized_logging_enabled" {
  description = "Enable centralized logging"
  type        = bool
  default     = true
}

variable "config_enabled" {
  description = "Enable AWS Config integration"
  type        = bool
  default     = true
}

variable "backup_enabled" {
  description = "Enable AWS Backup integration"
  type        = bool
  default     = false
}

variable "security_roles_enabled" {
  description = "Enable Control Tower security roles"
  type        = bool
  default     = true
}
