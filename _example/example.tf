provider "google" {
  project = "opsstation-474608"
  region  = "asia-northeast1"
  zone    = "asia-northeast1-a"
}

#-----------------------------------------------------------------
#-------------------------- (VPC) --------------------------------
#-----------------------------------------------------------------
module "vpc" {
  source                                    = "../"
  name                                      = "dev"
  environment                               = "test"
  label_order                               = ["name", "environment"]
  mtu                                       = 1460
  routing_mode                              = "REGIONAL"
  network_enabled                           = true
  network_firewall_policy_enforcement_order = "AFTER_CLASSIC_FIREWALL"
  delete_default_routes_on_create           = false
}