module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

#   availability_zone      = data.aws_availability_zones.azs.names[count.index]
  ami                    = "ami-0faac27e2fc42cead"
  instance_type          = "t2.micro" 
  name                   = "Django-todo-ansible-server"
  tags = {
    terraform            = "true"
    environment          = "production"
  }
    
}


