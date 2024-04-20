# locals{
#   vpc_name = "ec2cluster_django_vpc"
#   subnet_name = "ec2cluster_django_subnet"
#   security_group_name = "ec2cluster_django_sg"
# }


# data "aws_vpc" "selected" {
#   filter {
#     name = "tag:Name"
#     values = [local.vpc_name]

#   }
#   }


# data "aws_subnet" "selected" {
#   filter {
#     name = "tag:Name"
#     values = [local.subnet_name]

#   }

#   }


# data "aws_security_group" "selected" {
#   filter {
#     name = "tag:Name"
#     values = [local.security_group_name]

#   }
#   }

###################################################

# Fetching all availability zones in us-east-1

###################################################

data "aws_availability_zones" "azs" {}
