# variable "recipient" {
#   description = "value"
# }
# variable "policy_id" {
#   description = ""
# }

variable "email" {
  description = "The email address to receive notifications."
  type        = string
}

variable "product" {
  description = "The product the notification channel is associated with."
  type        = string
}

# variable "payload" {
#   description = "The payload template for the notification channel."
#   type        = string
# }

variable "filter_name" {
  description = "The name of the filter."
  type        = string
}

variable "policy_id" {
  description = "The ID of the alert policy."
  type        = string
}

# variable "recipient" {
#   description = "The email recipients for the alert channel."
#   type        = list(string)
# }
# variable "recipient" {
#   description = "The email recipients for the alert channel."
#   type        = list(string)
# }