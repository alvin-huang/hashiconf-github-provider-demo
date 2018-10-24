# Creates team-hashiconf
resource "github_team" "team_hashiconf" {
  name        = "team-hashiconf"
  description = "team from hashiconf!"
}

# Add users to team-hashiconf
resource "github_team_membership" "team_hashiconf_members" {
  count    = "${length(var.team_hashiconf_members)}"
  team_id  = "${github_team.team_hashiconf.id}"
  username = "${element(var.team_hashiconf_members, count.index)}"
}
