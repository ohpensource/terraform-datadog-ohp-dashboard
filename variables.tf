# variable "datadog_app_key" {
#   type        = string
#   description = "Datadog Application Key. To authenticate with datadog."
#   sensitive   = true
# }

# variable "datadog_api_key" {
#   type        = string
#   description = "Datadog API Key. To authenticate with datadog."
#   sensitive   = true
# }

variable "api_id" {
  type        = string
  description = "Id of the api to create the dashboard for."
}

variable "api_name" {
  type        = string
  description = "Name of the api/app the dashboard is for. Used to tag your dashboard for easier search."
}

variable "client" {
  type        = string
  description = "Name of the client that this dashboard will be monitoring the api for."
}

variable "stage" {
  type        = string
  description = "Name of the stage that this dashboard will be monitoring the api for: dev, tst, ..."
}

variable "title_context" {
  type        = string
  description = "Will prefix the title of the dashboard. Useful if you want to list all dashboard from a simple search in Datadog."
  default     = ""
}
