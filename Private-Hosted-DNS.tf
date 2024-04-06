resource "aws_route53_zone" "private_zone" {
  name = "internal"
  vpc {
    vpc_id = 
  }
}

resource "aws_route53_record" "db" {
  zone_id = aws_route53_zone.private_zone.zone_id
  name    = "db.internal"
  type    = "A"
  ttl     = "30"
  records = aws_instance.db.private_ip
}