output "condition_ids" {
  value = [for i in newrelic_nrql_alert_condition.browser_alert_condition : i.id]
}

