resource "newrelic_alert_policy" "browser_travelo" {
  name = "browser-travelo"
}

output "browser_travelo_id" {
  value = newrelic_alert_policy.browser_travelo.id
}