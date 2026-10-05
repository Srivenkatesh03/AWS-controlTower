module "organizations" {
  source = "./modules/organizations"

  client_name = var.client_name
}

module "organizations" {
  source = "./modules/organizations"

  client_name = var.client_name
}

module "organizational_units" {
  source = "./modules/organizational-units"

  root_id              = module.organizations.root_id
  organizational_units = var.organizational_units
}

module "accounts" {
  source = "./modules/accounts"

  accounts = var.accounts
}

module "control_tower" {
  source = "./modules/control-tower"

  landing_zone_version         = var.control_tower.landing_zone_version
  governed_regions             = var.control_tower.governed_regions
  centralized_logging_enabled  = var.control_tower.centralized_logging_enabled
  config_enabled               = var.control_tower.config_enabled
  backup_enabled               = var.control_tower.backup_enabled
  security_roles_enabled       = var.control_tower.security_roles_enabled
}