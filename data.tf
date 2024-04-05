data "aws_vpc" "selected" {
  id = "vpc-09032bd3b68b93e6d" 
    
  }


data "aws_subnet" "selected" {
  vpc_id = data.aws_vpc.selected.id
  id = "subnet-01c62371f47d21690" 
    
  }


data "aws_security_group" "selected" {
  vpc_id = data.aws_vpc.selected.id
  id = "sg-01dcadfa5df503d72" 
  }

###################################################

# Fetching all availability zones in us-east-1

###################################################

data "aws_availability_zones" "azs" {
  state = "available"
}


