resource "aws_s3_bucket" "anand9008" {
  bucket = "anand9008"
  provider = "aws.uswest"
  acl    = "private"
  tags = {
    Name        = "anand9008"
  }

lifecycle_rule {
    id      = "log"
    enabled = true

    prefix = "log/"

    tags = {
      "rule"      = "log"
      "autoclean" = "true"
    }

    transition {
      days          = 30
      storage_class = "STANDARD_IA" # or "ONEZONE_IA"
    }

    transition {
      days          = 60
      storage_class = "GLACIER"
    }

    expiration {
      days = 90
    }
  }


  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "MYBUCKETPOLICY",
  "Statement": [
    {
      "Sid": "IPAllow",
      "Effect": "Deny",
      "Principal": "*",
      "Action": "s3:*",
      "Resource": "arn:aws:s3:::anand9008/*",
      "Condition": {
         "IpAddress": {"aws:SourceIp": "117.193.164.2/32"}
      }
    }
  ]
}
POLICY

}
