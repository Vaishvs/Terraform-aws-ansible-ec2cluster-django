variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

# variable "ingress_cidr_block" {
#   type = string
#   default ="10.0.0.0/24"
# }

# variable "subnet_ids" {
#   type    = list(string)
#   default = [aws_subnet.cluster_subnet_a.id,aws_subnet.cluster_subnet_b.id]#["ec2cluster_subnet1", "ec2cluster_subnet2"] 
# }

variable "availability_zone1" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "custom_vpc" {
  type    = string
  default = "10.0.0.0/16"
}

