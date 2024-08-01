
//Notification channel 
# resource "newrelic_alert_channel" "email_channel" {
#   name = "Email Channel"
#   type = "email"
 
#   config {
#     recipients         = var.recipient
#     include_json_attachment = true
#   }
# }
//ASSOCIAITING THE ALERT CHANNEL WITH POLICY
# resource "newrelic_alert_policy_channel" "example_policy_channel" {
#   policy_id  = var.policy_id
#   channel_ids = [newrelic_alert_channel.email_channel.id]
# }
// Create a reusable notification destination for email
resource "newrelic_notification_destination" "email_destination" {
  name = "destination-email"
  type = "EMAIL"

  property {
    key   = "email"
    value = var.email
  }
}

// Create a notification channel to use in the workflow
resource "newrelic_notification_channel" "email_channel" {
  name            = "channel-email"
  type            = "EMAIL"
  destination_id  = newrelic_notification_destination.email_destination.id
  product         = var.product
  property {
    key ="Subject"
    value = "ALERT!"
  }
}


// alert channel for email notifications
# resource "newrelic_alert_channel" "email_alert_channel" {
#   name = "Email Alert Channel"
#   type = "email"
 
#   config {
#     recipients             = var.recipient
#     include_json_attachment = true
#   }
# }

// Associating the alert channel with an alert policy
# resource "newrelic_alert_policy_channel" "example_policy_channel" {
#   policy_id  = var.policy_id
#   channel_ids = [new]
# }

// A workflow that matches issues that include incidents triggered by the policy
resource "newrelic_workflow" "workflow_example" {
  name                   = "workflow-example"
  muting_rules_handling  = "NOTIFY_ALL_ISSUES"

  issues_filter {
    name = var.filter_name
    type = "FILTER"

    predicate {
      attribute = "labels.policyIds"
      operator  = "EXACTLY_MATCHES"
      values   = [var.policy_id]
    }
  }

  destination {
    channel_id = newrelic_notification_channel.email_channel.id
  }
}
