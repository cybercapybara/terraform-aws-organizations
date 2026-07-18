output "id" {
  description = "ID of the organization."
  value       = aws_organizations_organization.this.id
}

output "arn" {
  description = "ARN of the organization."
  value       = aws_organizations_organization.this.arn
}

output "master_account_id" {
  description = "Account ID of the organization's management account."
  value       = aws_organizations_organization.this.master_account_id
}

output "root_id" {
  description = "ID of the organization root."
  value       = aws_organizations_organization.this.roots[0].id
}

output "organizational_unit_ids" {
  description = "Map of organizational unit names to their IDs."
  value       = { for k, ou in aws_organizations_organizational_unit.this : k => ou.id }
}
