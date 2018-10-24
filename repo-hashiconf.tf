module "hashiconf-repo" {
  source      = "./boiler-repo"
  name        = "hashiconf"
  description = "Repo created from hashiconf!"

  auto_init   = true
  private     = false
  admin_teams = ["${github_team.team_hashiconf.id}"]
}
