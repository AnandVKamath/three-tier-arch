resource "aws_vpc_peering_connection" "web-app" {
  peer_owner_id = "${var.AWS_PEER_OWNER_ID}"
  peer_vpc_id   = "${aws_vpc.web.id}"
  vpc_id        = "${aws_vpc.app.id}"
  auto_accept   = true
  tags = {
    Name = "web-to-app"
  }
  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }
}
