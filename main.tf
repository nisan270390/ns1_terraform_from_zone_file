# Create a new DNS zone
resource "ns1_zone" "test" {
  zone = "${var.test_com}"
  ttl  = 600
}

module "test_com" {
  source = "./zones/test.com"
  zone = "${ns1_zone.test.zone}"
}
