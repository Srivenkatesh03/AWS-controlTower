variable "root_id" {
  description = "AWS Organizations root ID"
  type        = string
}

variable "organizational_units" {
  description = "Organizational Unit configuration"

  type = map(object({
    name   = string
    parent = optional(string)
  }))
}