locals {
  layout_type           = "ordered"
  prefix                = "${var.client}-${var.stage}-${var.api_name}"
  dashboard_title       = "${var.title_context}${local.prefix} (${var.api_id})"
  dashboard_description = <<EOF
API: ${var.api_id}

CLIENT: ${var.client}

STAGE: ${var.stage}

Availability [%]: Average number of requests answered with status code != 5xx.

Performance [ms]: Average response time.
EOF
}
