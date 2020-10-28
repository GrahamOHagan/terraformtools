variable "cron_expression" {
  description = "BST/DST version of your cron schedule."
  type = string
  default = "cron(30 0-12 * * ? *)"
}
