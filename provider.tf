terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
      version = "3.40.1"
    }
  }
}

provider "newrelic" {
  api_key = "NRAK-7N6EPOEBF8EKJ4AYZVRMDZJ2C82"
  region  = "US"  
  account_id = "4438262"
}