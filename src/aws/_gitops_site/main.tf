module "_instance" {
  source         = "github.com/Radical-Dave/Auto/data/providers/tf/templates/aws/_gitops_site"
  backend_bucket = var.backend_bucket
  name           = var.name
}