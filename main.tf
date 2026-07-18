resource "aws_organizations_organization" "this" {
  feature_set                   = var.feature_set
  aws_service_access_principals = var.aws_service_access_principals
  enabled_policy_types          = var.enabled_policy_types
}

resource "aws_organizations_organizational_unit" "this" {
  for_each = toset(var.organizational_units)

  name      = each.value
  parent_id = aws_organizations_organization.this.roots[0].id

  tags = var.tags
}
