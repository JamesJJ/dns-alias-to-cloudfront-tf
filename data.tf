data "aws_cloudfront_distribution" "cloudfront_distribution" {
  id = var.cloudfront_distribution_id
}

data "aws_route53_zone" "route53_zone" {
  name         = var.zone_name
  private_zone = false
}

