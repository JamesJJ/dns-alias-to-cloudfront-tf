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
2. Set `zone_name` to match your Route53 zone.
3. Set `cloudfront_distribution_id` to the ID of your Cloudfront distribution.
4. (Optional) To set other FQDNs rather than the domain root & www, uncomment and update `domain_prefixes`


```
module "dns-alias-to-cloudfront" {
  source                     = "git::https://github.com/brightbock/dns-alias-to-cloudfront-tf.git?ref=v0.3.0"
  zone_name                  = "example.com"
  cloudfront_distribution_id = "ABC12345"
  # domain_prefixes = [ "", "www" ]
}
```

