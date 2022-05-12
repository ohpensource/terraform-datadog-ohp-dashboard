resource "datadog_dashboard" "availability" {
  title       = local.dashboard_title
  description = local.dashboard_description
  layout_type = local.layout_type

  widget {
    group_definition {
      title       = "Availability + Performance"
      layout_type = local.layout_type

      widget {
        note_definition {
          content = "AVAILABILITY"
        }
      }

      # LATENCY
      widget {
        query_value_definition {
          request {
            q          = "sum:aws.apigateway.latency{apiid:${var.api_id}*}"
            aggregator = "avg"
          }
          custom_unit = "ms"
          precision   = "1"
          title       = "Average latency (response time)"
        }
      }
      widget {
        timeseries_definition {
          request {
            q = "avg:aws.apigateway.latency{apiid:${var.api_id}}"
          }
          title = "Latency (response time)"
        }
      }
      # 5XX RESPONSES
      widget {
        query_value_definition {
          request {
            q          = "sum:aws.apigateway.5xxerror{apiid:${var.api_id}*}.as_count()"
            aggregator = "sum"
          }
          title = "5XX responses"
        }
      }

      widget {
        timeseries_definition {
          request {
            q = "sum:aws.apigateway.5xxerror{apiid:${var.api_id}}.as_count()"
          }
          title = "Aggregated 5XX responses"
        }
      }
    }
  }
}
