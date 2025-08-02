variable "db_username" {
  type = string
}

variable "db_password" {
  type = string
}

variable "rds_sg_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "rds_subnet_group_name" {
  type = string
}