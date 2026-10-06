variable "enabled_policy_types" {
  description = "AWS Organizations policy types to enable"
  type        = list(string)
  default     = ["SERVICE_CONTROL_POLICY"]

  validation {
    condition     = length(var.enabled_policy_types) > 0
    error_message = "enabled_policy_types must include at least one policy type."
  }
}
