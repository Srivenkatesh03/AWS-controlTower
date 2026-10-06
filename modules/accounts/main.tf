resource "aws_organizations_account" "this" {
  for_each = var.accounts

  name      = each.value.name
  email     = each.value.email
  parent_id = var.organizational_units[each.value.ou].id

  lifecycle {
    precondition {
      condition     = contains(keys(var.organizational_units), each.value.ou)
      error_message = "Account '${each.key}' references unknown OU key '${each.value.ou}'."
    }
  }
}
