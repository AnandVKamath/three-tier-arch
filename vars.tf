variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_PEER_OWNER_ID" {}
variable "AWS_REGION" {
default = "us-east-1"
}
variable "AWS_REGION-1" {
default = "us-west-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-0400a1104d5b9caa1"
  }
}

