output "is_bst" {
  value = module.no_cron_schedule.bst
}

# In summer - returns "cron(30 0 * * ? *)", in winter returns "cron(30 1 * * ? *)"
output "simple_cron_schedule_1" {
  value = module.simple_cron_schedule_1.updated_cron
}

# In summer - returns "cron(30 12 * * ? *)", in winter returns "cron(30 13 * * ? *)"
output "simple_cron_schedule_2" {
  value = module.simple_cron_schedule_2.updated_cron
}

# In summer - returns "cron(30 23 * * ? *)", in winter returns "cron(30 0 * * ? *)"
output "simple_cron_schedule_3" {
  value = module.simple_cron_schedule_3.updated_cron
}

# In summer - returns "cron(30 0-12 * * ? *)", in winter returns "cron(30 1-13 * * ? *)"
output "range_cron_schedule" {
  value = module.range_cron_schedule.updated_cron
}

# In summer - returns "cron(30 0,6,12,18 * * ? *)", in winter returns "cron(30 1,7,13,19 * * ? *)"
output "values_cron_schedule" {
  value = module.values_cron_schedule.updated_cron
}
