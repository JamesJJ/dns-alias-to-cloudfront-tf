
resource "aws_route53_record" "a" {
  for_each        = toset(var.domain_prefixes)
  allow_overwrite = true
  zone_id         = data.aws_route53_zone.route53_zone.zone_id
  name            = join(each.key != "" ? "." : "", [each.key, data.aws_route53_zone.route53_zone.name])
  type            = "A"

  alias {
    name                   = data.aws_cloudfront_distribution.cloudfront_distribution.domain_name
    zone_id                = data.aws_cloudfront_distribution.cloudfront_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "aaaa" {
  for_each        = toset(var.domain_prefixes)
  allow_overwrite = true
  zone_id         = data.aws_route53_zone.route53_zone.zone_id
  name            = join(each.key != "" ? "." : "", [each.key, data.aws_route53_zone.route53_zone.name])
  type            = "AAAA"

  alias {
    name                   = data.aws_cloudfront_distribution.cloudfront_distribution.domain_name
    zone_id                = data.aws_cloudfront_distribution.cloudfront_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

