variable "dashboard_pages" {
  description = "A map of dashboard pages with their widgets"
  type = map(object({
    name        = string
    widgets     = list(object({
      type        = string
      title       = string
      row         = number
      column      = number
      width       = number
      height      = number
      nrql_query  = string
    }))
  }))
}