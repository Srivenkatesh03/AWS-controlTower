variable "landing_zone_version" {
  description = "AWS Control Tower landing zone version"
  type        = string
}

variable "governed_regions" {
  description = "AWS regions governed by Control Tower"
  type        = list(string)
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