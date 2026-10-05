output "organizational_units" {
  description = "Created organizational units"

  value = merge(
    {
      for key, ou in aws_organizations_organizational_unit.root :
      key => {
        id   = ou.id
        name = ou.name
      }
    },
    {
      for key, ou in aws_organizations_organizational_unit.child :
      key => {
        id   = ou.id
        name = ou.name
      }
    }
  )
}