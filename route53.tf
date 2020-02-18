variable "dns" {
  default = "aa.dekker-and.digital"
}

resource "aws_route53_zone" "main" {
  name = var.dns
}

output "main_name_servers" {
  value = aws_route53_zone.main.name_servers
}

resource "aws_route53_record" "main-txt" {
  zone_id = aws_route53_zone.main.id
  name = var.dns
  type = "TXT"
  records = [
    "test=abc", # more text records can be added below
  ]
  ttl = 900
}


resource "aws_route53_record" "andy-zone" {
  name = "andy.${var.dns}"
  zone_id = aws_route53_zone.main.id
  type = "NS"
  ttl = 900
  records = [
    "ns-1731.awsdns-24.co.uk",
    "ns-599.awsdns-10.net",
    "ns-247.awsdns-30.com",
    "ns-1440.awsdns-52.org"
  ]
}
