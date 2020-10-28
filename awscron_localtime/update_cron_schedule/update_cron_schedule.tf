locals {
  split_cron_schedule = split(" ", var.cron_expression)
  hour = element(local.split_cron_schedule, 1)

  cron_hour_simple = try(
    [tonumber(local.hour)],
    [false]
  )

  cron_hour_range = length(split("-", local.hour)) > 1 ? split("-", local.hour) : [false]

  cron_hour_values = length(split(",", local.hour)) > 1 ? split(",", local.hour) : [false]

  cron_hour_simple_updated = join("", [
    for i in local.cron_hour_simple:
    i == 23 ? "0" : tostring(i+1)
    if i != false
  ])

  cron_hour_range_updated = join("-", [
    for i in local.cron_hour_range:
    i == "23" ? "0" : tostring(tonumber(i)+1)
    if i != false && i != "false"
  ])

  cron_hour_values_updated = join(",", [
    for i in local.cron_hour_values:
    i == "23" ? "0" : tostring(tonumber(i)+1)
    if i != false && i != "false"
  ])

  updated_cron_hour = coalesce(local.cron_hour_simple_updated, local.cron_hour_range_updated, local.cron_hour_values_updated)

  updated_cron_schedule = join(" ", concat(slice(local.split_cron_schedule, 0, 1), [local.updated_cron_hour], slice(local.split_cron_schedule, 2, 6)))
}

output "updated_cron_schedule" {
  description = "Returns cron with the hour segement incremented by 1."
  value = local.updated_cron_schedule
}
