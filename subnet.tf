# resource "aws_subnet" "clustersubnet" {
#   vpc_id     = aws_vpc.clustervpc.id
#   cidr_block = "10.0.0.0/24"

#   tags = {
#     Name = "ec2cluster_django_subnet"
#   }
# }


resource "aws_subnet" "cluster_subnet" {
  count = "${length(data.aws_availability_zones.azs.names)}"
  vpc_id = "${aws_vpc.clustervpc.id}"
  cidr_block = "10.0.${10+count.index}.0/24"
  availability_zone = "${data.aws_availability_zones.azs.names[count.index]}"
  map_public_ip_on_launch = false
  tags = {
    Name = "ec2cluster_django_subnet"
  }
 
}