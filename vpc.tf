resource "aws_vpc" "clustervpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "ec2cluster__vpc"
  }
}

resource "aws_internet_gateway" "gwcluster" {
  vpc_id = aws_vpc.clustervpc.id

  tags = {
    Name = "cluster_internet_gateway"
  }
}


resource "aws_internet_gateway_attachment" "gwattachment" {
  internet_gateway_id = aws_internet_gateway.gwcluster.id
  vpc_id              = aws_vpc.clustervpc.id
}
