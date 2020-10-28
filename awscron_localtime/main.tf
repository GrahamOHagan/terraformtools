module "last_sunday_of_march" {
  source = "./last_sunday_of_month"
  month = "03"
}

module "last_sunday_of_october" {
  source = "./last_sunday_of_month"
  month = "10"
}

module "updated_cron_schedule" {
  source = "./update_cron_schedule"
  cron_expression = var.cron_expression != "" ? var.cron_expression : "cron(0 0 * * ? *)"
}

locals {
  today = formatdate("YYYYMMDDhhmmss", timestamp())
  last_sunday_of_march_formatted = formatdate("YYYYMMDDhhmmss", module.last_sunday_of_march.last_sunday_of_month)
  last_sunday_of_october_formatted = formatdate("YYYYMMDDhhmmss", module.last_sunday_of_october.last_sunday_of_month)
  bst = local.today > local.last_sunday_of_march_formatted && local.today < local.last_sunday_of_october_formatted ? true : false
}

output "bst" {
  value = local.bst
}

output "updated_cron" {
  value = local.bst || var.cron_expression == "" ? var.cron_expression : module.updated_cron_schedule.updated_cron_schedule
}
