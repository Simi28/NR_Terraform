email = "bhadoriasameeksha@gmail.com"

product = "IINT"

# payload          = <<EOF
# {
#   "subject": "Alert: ${incident.title}",
#   "body": "Details: ${incident.details}\nStatus: ${incident.status}"
# }
# EOF

# recipients = [ "bhadoriasameeksha@gmail.com" ]

filter_name = "workflow-filter"


dashboard_pages = {
  "frontend" = {
    name    = "FRONTEND"
    widgets = [
      {
        type        = "billboard"
        title       = "Page Load Time"
        row         = 1
        column      = 1
        width       = 6
        height      = 3
        nrql_query  = "SELECT average(pageLoadDuration) FROM PageView WHERE appName = 'travelo-browser'"
      },
      {
        type        = "bar"
        title       = "Requests per Minute"
        row         = 1
        column      = 7
        width       = 6
        height      = 3
        nrql_query  = "SELECT rate(count(*), 1 minute) FROM PageView WHERE appName = 'travelo-browser'"
      },
      {
        type        = "line"
        title       = "Errors per Minute"
        row         = 5
        column      = 1
        width       = 6
        height      = 3
        nrql_query  = "SELECT average(backendDuration) FROM PageView WHERE appName = 'travelo-browser'"
      }
    ]
  },
  "backend" = {
    name    = "BACKEND"
    widgets = [
      {
        type        = "billboard"
        title       = "API Response Time"
        row         = 1
        column      = 1
        width       = 6
        height      = 3
        nrql_query  = "SELECT average(databaseCallCount) FROM Transaction WHERE appName = 'travelo'"
      },
      {
        type        = "bar"
        title       = "Database Query Time"
        row         = 1
        column      = 7
        width       = 6
        height      = 3
        nrql_query  = "SELECT average(webDuration) FROM Transaction WHERE appName = 'travelo'"
      },
      {
        type        = "line"
        title       = "Backend Errors"
        row         = 5
        column      = 1
        width       = 6
        height      = 3
        nrql_query  = "SELECT rate(count(*), 1 minute) FROM TransactionError WHERE appName = 'travelo'"
      }
    ]
  }
}
