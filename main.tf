module "alert_policies" {
  source     = "./modules/alert_policies"
  account_id = "4438262"
}

module "alert_conditions" {
  source     = "./modules/alert_conditions"
  account_id = "4438262"
  policy_id  = module.alert_policies.browser_travelo_id
  queries = [
    {
      name                     = "Error Rate"
      description              = "Alert when browser error rate is high"
      query                    = "SELECT average(pageRenderingDuration) FROM PageView WHERE appName = 'travelo-browser'"
      critical_operator        = "above"
      critical_threshold       = 1.0
      critical_threshold_duration = 300
      warning_operator         = "above"
      warning_threshold        = 0.2
      warning_threshold_duration = 600
    },
    {
      name                     = "LCP"
      description              = "Alert when LCP is poor"
      query                    = "from Metric SELECT average(newrelic.goldenmetrics.browser.application.largestContentfulPaint75PercentileS) AS 'LCP' WHERE appName = 'travelo-browser'"
      critical_operator        = "above"
      critical_threshold       = 4
      critical_threshold_duration = 300
      warning_operator         = "above"
      warning_threshold        = 2.4
      warning_threshold_duration = 600
    },
    {
      name                     = "Backend-Duration"
      description              = "Alert when Duration is high"
      query                    = "from PageView SELECT average(backendDuration) WHERE appName = 'travelo-browser'"
      critical_operator        = "above"
      critical_threshold       = 13
      critical_threshold_duration = 300
      warning_operator         = "above"
      warning_threshold        = 0.5
      warning_threshold_duration = 300
    }

    // Add more queries as needed 
  ]
}

module "Alert_Worklfow" {
  source = "./modules/alert_workflow"
  product = var.product
  filter_name = var.filter_name
  email = var.email
  policy_id = module.alert_policies.browser_travelo_id
}

module "Dashboards" {
  source = "./modules/dashboards"
  dashboard_pages = var.dashboard_pages
  
}