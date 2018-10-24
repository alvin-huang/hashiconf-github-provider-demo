# Add an admin/owner to a GitHub Organization
resource "github_membership" "org_owners" {
  count    = "${length(var.org_owners)}"
  username = "${element(var.org_owners, count.index)}"
  role     = "admin"
}

# Add a member to a GitHub Organization
resource "github_membership" "org_members" {
  count    = "${length(var.org_members)}"
  username = "${element(var.org_members, count.index)}"
  role     = "member"
}
