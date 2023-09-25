variable "name" {
  type    = string
  default = "mybucket"
}

variable "env" {
  type    = string
  default = "prod"
}

variable "region" {
  type    = string
  default = "us-west-2"
}

variable "create_vpc" {
  type    = bool
  default = true
}

variable "versioning" {
  type    = string
  default = "Enabled"
}