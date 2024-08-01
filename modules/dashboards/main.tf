# resource "newrelic_one_dashboard" "travelo" {
#   name        = "New Relic Terraform Example"
#   permissions = "public_read_only"

#   page {
#     name = "fRONTEND"

#     widget_billboard {
#       title  = "Requests per minute"
#       row    = 1
#       column = 1
#       width  = 6
#       height = 3

#       nrql_query {
#         query = "SELECT average(pageRenderingDuration) FROM PageView WHERE appName = 'travelo-browser'"
#       }
#     }
#   }
# }
resource "newrelic_one_dashboard" "travelo" {
  name        = "travelo-dashboard"
  permissions = "public_read_only"

  dynamic "page" {
    for_each = var.dashboard_pages
    content {
      name = page.value.name

      dynamic "widget_billboard" {
        for_each = [for w in page.value.widgets : w if w.type == "billboard"]
        content {
          title  = widget_billboard.value.title
          row    = widget_billboard.value.row
          column = widget_billboard.value.column
          width  = widget_billboard.value.width
          height = widget_billboard.value.height

          nrql_query {
            query = widget_billboard.value.nrql_query
          }
        }
      }

      dynamic "widget_bar" {
        for_each = [for w in page.value.widgets : w if w.type == "bar"]
        content {
          title  = widget_bar.value.title
          row    = widget_bar.value.row
          column = widget_bar.value.column
          width  = widget_bar.value.width
          height = widget_bar.value.height

          nrql_query {
            query = widget_bar.value.nrql_query
          }
        }
      }

      dynamic "widget_line" {
        for_each = [for w in page.value.widgets : w if w.type == "line"]
        content {
          title  = widget_line.value.title
          row    = widget_line.value.row
          column = widget_line.value.column
          width  = widget_line.value.width
          height = widget_line.value.height

          nrql_query {
            query = widget_line.value.nrql_query
          }
        }
      }
    }
  }
}