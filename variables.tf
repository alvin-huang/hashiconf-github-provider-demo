# GitHub Personal Access Token
variable "github_token" {}

# GitHub Organization to manage
variable "github_organization" {}

# List of org admins
variable "org_owners" {
  type    = "list"
  default = []
}

# List of org members
variable "org_members" {
  type    = "list"
  default = []
}

# List of hashiconf team members
variable "team_hashiconf_members" {
  type = "list"
}
