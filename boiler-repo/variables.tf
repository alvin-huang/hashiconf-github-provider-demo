variable "name" {}

variable "description" {
  default = ""
}

variable "private" {
  default = "true"
}

variable "auto_init" {
  default = false
}

variable "has_wiki" {
  default = false
}

variable "has_projects" {
  default = false
}

variable "has_issues" {
  default = true
}

variable "collaborators" {
  type    = "list"
  default = []
}

variable "read_teams" {
  type    = "list"
  default = []
}

variable "write_teams" {
  type    = "list"
  default = []
}

variable "admin_teams" {
  type    = "list"
  default = []
}
