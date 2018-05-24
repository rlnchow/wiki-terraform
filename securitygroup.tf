data "aws_ip_ranges" "west_east_ec2" {
  regions  = ["us-west-2", "us-east-1"]
  services = ["ec2"]
}

resource "aws_security_group" "from_west_east" {
  name        = "west_east"
  description = "Allow only west and east AWS traffic"

  ingress {
    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"
    cidr_blocks = ["${data.aws_ip_ranges.west_east_ec2.cidr_blocks}"]
  }

  tags {
    Name       = "Allow_east_west"
    CreateDate = "${data.aws_ip_ranges.west_east_ec2.create_date}"
    SyncToken  = "${data.aws_ip_ranges.west_east_ec2.sync_token}"
  }
}

resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all inbound traffic"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "allow_all"
  }
}
