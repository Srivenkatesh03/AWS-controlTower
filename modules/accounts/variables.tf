variable "accounts" {
  description = "Account definitions for the project"

  type = map(object({
    name  = string
    email = string
    ou    = string
  }))

  default = {}
}