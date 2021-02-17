# Route53 DNS to Cloudfront CDN

This is a simple Terraform module that add DNS aliases in Route53 for the root of a domain and `www.` to point to a specified Cloudfront distribution. For example:

```
example.com     A    ->  Cloudfront with ID ABC12345
example.com     AAAA ->  Cloudfront with ID ABC12345
www.example.com A    ->  Cloudfront with ID ABC12345
www.example.com AAAA ->  Cloudfront with ID ABC12345
```

  * Both `A` and `AAAA` aliases are created.
  * Existing records are overwritten!

## How to use:

1. Add the definition below to your Terraform.
2. Set `zone_name`, `zone_id` to match your Route53 zone.
3. Set `cloudfront_distribution_id` to the ID of your Cloudfront distribution.

```
module "dns-alias-to-cloudfront" {
  source                     = "git::https://github.com/brightbock/dns-alias-to-cloudfront-tf.git?ref=main"
  zone_name                  = "example.com"
  zone_id                    = "XYZ009988"
  cloudfront_distribution_id = "ABC12345"
}
```

---

If you need to determine the Route53 `zone_id` automatically, you can set `zone_id = data.aws_route53_zone.my_r53_zone.zone_id` with this additional config:

```
data "aws_route53_zone" "my_r53_zone" {
  name         = "example.com."
  private_zone = false
}
```