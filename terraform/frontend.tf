resource "aws_s3_bucket" "react_app_bucket" {
  bucket = var.s3_react_app

  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}

resource "aws_s3_bucket_object" "react_app" {
  bucket = aws_s3_bucket.react_app_bucket.bucket
  key    = "index.html"
  source = "../frontend/build/index.html"
  acl    = "public-read"
}

resource "aws_cloudfront_distribution" "react_app_cdn" {
  origin {
    domain_name = aws_s3_bucket.react_app_bucket.bucket_regional_domain_name
    origin_id   = aws_s3_bucket.react_app_bucket.bucket
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = aws_s3_bucket.react_app_bucket.bucket

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}