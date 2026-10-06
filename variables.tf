variable "client_name" {
  description = "Name of the client"
  type        = string

  validation {
    condition     = length(trimspace(var.client_name)) > 0
    error_message = "client_name must not be empty."
  }
}

variable "project_name" {
  description = "Name of the project"
  type        = string

  validation {
    condition     = length(trimspace(var.project_name)) > 0
    error_message = "project_name must not be empty."
  }
}

variable "aws_region" {
  description = "AWS Control Tower home region"
  type        = string

  validation {
    condition     = can(regex("^[a-z]{2}-[a-z]+-[0-9]+$", var.aws_region))
    error_message = "aws_region must look like a valid AWS region (for example, us-east-1)."
  }
}

variable "enabled_regions" {
  description = "AWS regions governed by the landing zone"
  type        = list(string)

  validation {
    condition = length(var.enabled_regions) > 0 && alltrue([
      for region in var.enabled_regions : can(regex("^[a-z]{2}-[a-z]+-[0-9]+$", region))
    ])
    error_message = "enabled_regions must include at least one valid AWS region name."
  }
}

variable "environment" {
  description = "Primary project environment"
  type        = string

  validation {
    condition     = length(trimspace(var.environment)) > 0
    error_message = "environment must not be empty."
  }
}

variable "mandatory_tags" {
  description = "Mandatory tags applied to AWS resources"
  type        = map(string)

  default = {}
}

variable "organizational_units" {
  description = "Organizational Units required by the project"

  type = map(object({
    name   = string
    parent = optional(string)
  }))

  default = {}

  validation {
    condition = alltrue([
      for key, ou in var.organizational_units :
      ou.parent == null || contains(keys(var.organizational_units), ou.parent)
    ])
    error_message = "Each OU parent must reference another OU key from organizational_units."
  }

  validation {
    condition = alltrue([
      for key, ou in var.organizational_units :
      ou.parent == null || try(var.organizational_units[ou.parent].parent, null) == null
    ])
    error_message = "Nested OU parents deeper than one child level are not supported. Child OUs must reference a top-level OU."
  }
}

variable "accounts" {
  description = "AWS accounts to create"

  type = map(object({
    name  = string
    email = string
    ou    = string
  }))

  validation {
    condition = alltrue([
      for account in values(var.accounts) :
      length(trimspace(account.name)) > 0 &&
      can(regex("^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$", account.email)) &&
      length(trimspace(account.ou)) > 0
    ])
    error_message = "Each account must include non-empty name/ou values and a valid email format."
  }

  validation {
    condition     = length(distinct([for account in values(var.accounts) : lower(account.email)])) == length(var.accounts)
    error_message = "Account email values must be unique."
  }

  validation {
    condition = alltrue([
      for account in values(var.accounts) : contains(keys(var.organizational_units), account.ou)
    ])
    error_message = "Each account.ou must reference a key from organizational_units."
  }
}

variable "control_tower" {
  description = "Control Tower configuration"

  type = object({
    landing_zone_version        = string
    governed_regions            = list(string)
    centralized_logging_enabled = bool
    config_enabled              = bool
    backup_enabled              = bool
    security_roles_enabled      = bool
  })

  validation {
    condition     = length(trimspace(var.control_tower.landing_zone_version)) > 0
    error_message = "control_tower.landing_zone_version must not be empty."
  }

  validation {
    condition = length(var.control_tower.governed_regions) > 0 && alltrue([
      for region in var.control_tower.governed_regions : can(regex("^[a-z]{2}-[a-z]+-[0-9]+$", region))
    ])
    error_message = "control_tower.governed_regions must include at least one valid AWS region name."
  }
}
