variable "cloudfront_distribution_id" {
}
variable "zone_name" {
}
variable "domain_prefixes" {
  type    = list(any)
  default = ["", "www"]
}
variable "aws_region" {
  type    = string
  default = "us-east-1"
}
