# Define a GitHub Repository
resource "github_repository" "repo" {
  name         = "${var.name}"
  description  = "${var.description}"
  has_issues   = "${var.has_issues}"
  has_wiki     = "${var.has_wiki}"
  has_projects = "${var.has_projects}"

  auto_init = "${var.auto_init}"
  private   = "${var.private}"
}

# Add a Branch Restriction
resource "github_branch_protection" "repo" {
  repository     = "${github_repository.repo.name}"
  branch         = "master"
  enforce_admins = true

  required_status_checks {
    strict = true
  }

  required_pull_request_reviews {
    dismiss_stale_reviews = true
  }
}

# Add a sample GitHub issue label
resource "github_issue_label" "good_first_issue" {
  repository = "${github_repository.repo.name}"
  name       = "hashiconf-issue"
  color      = "128A0C"
}

# Add external collaborators to a repo
# defaults to 'push' permissions
resource "github_repository_collaborator" "collaborator" {
  count      = "${length(var.collaborators)}"
  repository = "${github_repository.repo.name}"
  username   = "${element(var.collaborators, count.index)}"
}

# What teams have read access?
resource "github_team_repository" "read_teams" {
  count      = "${length(var.read_teams)}"
  repository = "${github_repository.repo.name}"
  team_id    = "${element(var.read_teams, count.index)}"
  permission = "pull"
}

# What teams have write access?
resource "github_team_repository" "write_teams" {
  count      = "${length(var.write_teams)}"
  repository = "${github_repository.repo.name}"
  team_id    = "${element(var.write_teams, count.index)}"
  permission = "push"
}

# What teams have admin access?
resource "github_team_repository" "admin_teams" {
  count      = "${length(var.admin_teams)}"
  repository = "${github_repository.repo.name}"
  team_id    = "${element(var.admin_teams, count.index)}"
  permission = "admin"
}
