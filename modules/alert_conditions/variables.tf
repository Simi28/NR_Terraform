variable "account_id" {
    
}

variable "policy_id" {
  description = "ID of the New Relic alert policy"
  
}

variable "queries" {
  description = "List of queries for alert conditions"
  type        = list(object({
    name                     = string
    description              = string
    query                    = string
    critical_operator        = string
    critical_threshold       = number
    critical_threshold_duration = number
    warning_operator         = string
    warning_threshold        = number
    warning_threshold_duration = number
  }))
}