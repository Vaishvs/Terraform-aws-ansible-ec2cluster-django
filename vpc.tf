resource "aws_vpc" "clustervpc" {
  cidr_block = var.custom_vpc

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


# resource "aws_internet_gateway_attachment" "gwattachment" {
#   internet_gateway_id = aws_internet_gateway.gwcluster.id
#   vpc_id              = aws_vpc.clustervpc.id
# }


# Creating Public Route Table:

#############################################
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.clustervpc.id

  tags = {
    "Name" = "Public-RouteTable"
  }
}

# Creating Public Route:

#############################################

resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gwcluster.id
}

#############################################

# Creating Public Route Table Association:

#############################################

resource "aws_route_table_association" "public_rt_association" {
  count          = length(aws_subnet.cluster_subnet) == 3 ? 3 : 0
  route_table_id = aws_route_table.public_rt.id
  subnet_id      = element(aws_subnet.cluster_subnet.*.id, count.index)
}