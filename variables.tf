variable "feature_set" {
  description = "Feature set to enable for the organization. Either ALL or CONSOLIDATED_BILLING."
  type        = string
  default     = "ALL"

  validation {
    condition     = contains(["ALL", "CONSOLIDATED_BILLING"], var.feature_set)
    error_message = "feature_set must be either ALL or CONSOLIDATED_BILLING."
  }
}

variable "aws_service_access_principals" {
  description = "List of AWS service principals granted access across the organization."
  type        = list(string)
  default     = []
}

variable "enabled_policy_types" {
  description = "List of organization policy types to enable in the root."
  type        = list(string)
  default     = []
}

variable "organizational_units" {
  description = "List of organizational units to create directly under the organization root."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags applied to the organizational units."
  type        = map(string)
  default     = {}
}
