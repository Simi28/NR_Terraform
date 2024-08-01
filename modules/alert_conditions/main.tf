resource "newrelic_nrql_alert_condition" "browser_alert_condition" {
  count      = length(var.queries)
  account_id = var.account_id
  policy_id  = var.policy_id

  name           = var.queries[count.index].name
  type           = "static"
  description    = var.queries[count.index].description
  enabled        = true
  violation_time_limit_seconds = 3600
  fill_option    = "static"
  fill_value     = 1.0
  aggregation_window = 60
  aggregation_method = "event_flow"
  aggregation_delay  = 120
  expiration_duration = 120
  open_violation_on_expiration = true
  close_violations_on_expiration = true
  slide_by       = 30

  nrql {
    query = var.queries[count.index].query
  }

  critical {
    operator              = var.queries[count.index].critical_operator
    threshold             = var.queries[count.index].critical_threshold 
    threshold_duration    = var.queries[count.index].critical_threshold_duration
    threshold_occurrences = "ALL"
  }

  warning {
    operator              = var.queries[count.index].warning_operator
    threshold             = var.queries[count.index].warning_threshold
    threshold_duration    = var.queries[count.index].warning_threshold_duration
    threshold_occurrences = "ALL"
  }
}
# "SELECT average(pageRenderingDuration) FROM PageView WHERE appName = 'travelo-browser'"
# from Metric SELECT average(newrelic.goldenmetrics.browser.application.largestContentfulPaint75PercentileS) AS 'LCP' WHERE appName = 'travelo-browser'