module "no_cron_schedule" {
  source = "../../awscron_localtime"
}

module "simple_cron_schedule_1" {
  source = "../../awscron_localtime"
  cron_expression = "cron(30 0 * * ? *)"
}

module "simple_cron_schedule_2" {
  source = "../../awscron_localtime"
  cron_expression = "cron(30 12 * * ? *)"
}

module "simple_cron_schedule_3" {
  source = "../../awscron_localtime"
  cron_expression = "cron(30 23 * * ? *)"
}

module "range_cron_schedule" {
  source = "../../awscron_localtime"
  cron_expression = "cron(30 0-12 * * ? *)"
}

module "values_cron_schedule" {
  source = "../../awscron_localtime"
  cron_expression = "cron(30 0,6,12,18 * * ? *)"
}
