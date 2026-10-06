output "organization_id" {
  description = "AWS Organization ID"
  value       = module.organizations.organization_id
}

output "root_id" {
  description = "AWS Organizations root ID"
  value       = module.organizations.root_id
}

output "management_account_id" {
  description = "AWS Organizations management account ID"
  value       = module.organizations.management_account_id
}

output "organizational_units" {
  description = "Organizational units keyed by input key"
  value       = module.organizational_units.organizational_units
}

output "account_ids" {
  description = "Account IDs keyed by account key"
  value       = module.accounts.account_ids
}

output "accounts" {
  description = "Account details keyed by account key"
  value       = module.accounts.accounts
}

output "control_tower_landing_zone" {
  description = "Control Tower landing zone details"
  value       = module.control_tower.landing_zone
}
