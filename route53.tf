resource "aws_route53_zone" "main" {
  name = "dekker.and.digital"
}
output "main_name_servers" {
  value = aws_route53_zone.main.name_servers
}
resource "aws_route53_record" "main-txt" {
  zone_id = aws_route53_zone.main.id
  name = "andy.dekker.and.digital"
  type = "TXT"
  records = [
    "ns-1731.awsdns-24.co.uk",
    "ns-599.awsdns-10.net",
    "ns-247.awsdns-30.com",
    "ns-1440.awsdns-52.org"
  ]
  ttl = 900
}
