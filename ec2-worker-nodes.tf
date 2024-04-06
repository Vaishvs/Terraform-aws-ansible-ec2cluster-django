module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  count                  = 3
  availability_zone      = data.aws_availability_zones.azs.names[count.index]
  ami                    = "ami-0faac27e2fc42cead"
  instance_type          = "t2.micro" 
  name                   = "Django-todo-${count.index}"
  associate_public_ip_address = "false"
  iam_instance_profile = aws_iam_instance_profile.ssm_profile
  tags = {
    terraform            = "true"
    environment          = "production"
  }
  
  
}

 
