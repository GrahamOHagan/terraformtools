locals {
  this_year = formatdate("YYYY", timestamp())
  last_week_of_month = ["31", "30", "29", "28", "27", "26", "25"]
}

output "last_sunday_of_month" {
  value = join("", [
    for dt in local.last_week_of_month:
    "${local.this_year}-${var.month}-${dt}T00:00:00Z"
    if formatdate("EEEE", "${local.this_year}-${var.month}-${dt}T00:00:00Z") == "Sunday"
  ])
}
