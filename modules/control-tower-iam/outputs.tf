output "control_tower_admin_role_arn" {
  description = "ARN of the AWSControlTowerAdmin role."
  value       = var.enabled ? aws_iam_role.control_tower_admin[0].arn : null
}

output "cloudtrail_role_arn" {
  description = "ARN of the AWSControlTowerCloudTrailRole role."
  value       = var.enabled ? aws_iam_role.cloudtrail[0].arn : null
}

output "stackset_role_arn" {
  description = "ARN of the AWSControlTowerStackSetRole role."
  value       = var.enabled ? aws_iam_role.stackset[0].arn : null
}