resource "aws_security_group" "clustersg" {
  name        = "ec2cluster_django_sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.clustervpc.id

  tags = {
    Name = "ec2cluster_django_sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "clustersghttps" {
  security_group_id = aws_security_group.clustersg.id
  cidr_ipv4         = aws_vpc.clustervpc.cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "clustersgssh" {
  security_group_id = aws_security_group.clustersg.id
  cidr_ipv4         = aws_vpc.clustervpc.cidr_block
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "clustersghttp" {
  security_group_id = aws_security_group.clustersg.id
  cidr_ipv4         = aws_vpc.clustervpc.cidr_block
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.clustersg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

