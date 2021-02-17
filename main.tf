data "aws_cloudfront_distribution" "cloudfront_distribution" {
  id = var.cloudfront_distribution_id
}

resource "aws_route53_record" "root-a" {
  allow_overwrite = true
  zone_id         = var.zone_id
  name            = var.zone_name
  type            = "A"

  alias {
    name                   = data.aws_cloudfront_distribution.cloudfront_distribution.domain_name
    zone_id                = data.aws_cloudfront_distribution.cloudfront_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "root-aaaa" {
  allow_overwrite = true
  zone_id         = var.zone_id
  name            = var.zone_name
  type            = "AAAA"

  alias {
    name                   = data.aws_cloudfront_distribution.cloudfront_distribution.domain_name
    zone_id                = data.aws_cloudfront_distribution.cloudfront_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www-a" {
  allow_overwrite = true
  zone_id         = var.zone_id
  name            = "www.${var.zone_name}"
  type            = "A"

  alias {
    name                   = data.aws_cloudfront_distribution.cloudfront_distribution.domain_name
    zone_id                = data.aws_cloudfront_distribution.cloudfront_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www-aaaa" {
  allow_overwrite = true
  zone_id         = var.zone_id
  name            = "www.${var.zone_name}"
  type            = "AAAA"

  alias {
    name                   = data.aws_cloudfront_distribution.cloudfront_distribution.domain_name
    zone_id                = data.aws_cloudfront_distribution.cloudfront_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

