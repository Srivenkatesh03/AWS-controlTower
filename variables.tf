variable "client_name" {
  description = "Name of the client"
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "aws_region" {
  description = "AWS Control Tower home region"
  type        = string
}

variable "enabled_regions" {
  description = "AWS regions governed by the landing zone"
  type        = list(string)
}

variable "environment" {
  description = "Primary project environment"
  type        = string
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
}

variable "accounts" {
  description = "AWS accounts to create"
  
  type = map(object({
    name  = string
    email = string
    ou    = string
  }))
}

variable "control_tower" {
  description = "Control Tower configuration"

  type = object({
    landing_zone_version          = string
    governed_regions              = list(string)
    centralized_logging_enabled  = bool
    config_enabled                = bool
    backup_enabled                = bool
    security_roles_enabled       = bool
  })
}