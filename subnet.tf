# resource "aws_subnet" "clustersubnet" {
#   vpc_id     = aws_vpc.clustervpc.id
#   cidr_block = "10.0.0.0/24"

#   tags = {
#     Name = "ec2cluster_django_subnet"
#   }
# }


# resource "aws_subnet" "cluster_subnet" {
#   count = "${length(data.aws_availability_zones.azs.names)}"
#   vpc_id = "${aws_vpc.clustervpc.id}"
#   cidr_block = "10.0.${10+count.index}.0/24"
#   availability_zone = "${data.aws_availability_zones.azs.names[count.index]}"
#   map_public_ip_on_launch = false
#   tags = {
#     Name = "ec2cluster_django_subnet"
#   }
 
# }

resource "aws_subnet" "cluster_subnet_a" {
  vpc_id            = "${aws_vpc.clustervpc.id}"
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "ec2cluster_subnet1"
  }
}

resource "aws_subnet" "cluster_subnet_b" {
  vpc_id            = "${aws_vpc.clustervpc.id}"
  cidr_block        = "10.0.2.0/24"#"10.0.2.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "ec2cluster_subnet2"
  }
}

resource "aws_subnet" "cluster_subnet_c" {
  vpc_id            = "${aws_vpc.clustervpc.id}"
  cidr_block        = "10.0.3.0/24"#"10.0.2.0/24"
  availability_zone = "us-east-1c"
  tags = {
    Name = "ec2cluster_subnet3"
  }
}
