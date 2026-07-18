# terraform-aws-organizations

Terraform module that manages an [AWS
Organizations](https://aws.amazon.com/organizations/) organization. It creates
the organization for the calling management account and provisions a flat list
of organizational units directly under the root.

## Usage

```hcl
module "organizations" {
  source = "github.com/cybercapybara/terraform-aws-organizations"

  feature_set          = "ALL"
  organizational_units = ["workloads", "sandbox"]

  tags = {
    ManagedBy = "terraform"
  }
}
```

A runnable example lives in [`examples/basic`](examples/basic).

## Requirements

| Name      | Version  |
|-----------|----------|
| terraform | >= 1.5   |
| aws       | >= 5.0   |

## Inputs

| Name                            | Description                                             | Type           | Default   | Required |
|---------------------------------|---------------------------------------------------------|----------------|-----------|:--------:|
| `feature_set`                   | Feature set. ALL or CONSOLIDATED_BILLING.               | `string`       | `"ALL"`   |    no    |
| `aws_service_access_principals` | Service principals granted org-wide access.             | `list(string)` | `[]`      |    no    |
| `enabled_policy_types`          | Organization policy types to enable in the root.        | `list(string)` | `[]`      |    no    |
| `organizational_units`          | Organizational units to create under the root.          | `list(string)` | `[]`      |    no    |
| `tags`                          | Tags applied to the organizational units.               | `map(string)`  | `{}`      |    no    |

## Outputs

| Name                      | Description                                        |
|---------------------------|----------------------------------------------------|
| `id`                      | ID of the organization.                            |
| `arn`                     | ARN of the organization.                           |
| `master_account_id`       | Account ID of the management account.              |
| `root_id`                 | ID of the organization root.                       |
| `organizational_unit_ids` | Map of organizational unit names to their IDs.     |

## License

[MIT](LICENSE)
