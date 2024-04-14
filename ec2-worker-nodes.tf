resource "aws_instance" "ec2_workernode" {

   count                       = 3
   availability_zone      = data.aws_availability_zones.azs.names[count.index]
   ami             = "ami-0854b52d6f4539dfc"
  instance_type   = "t2.micro"
  subnet_id        = aws_subnet.cluster_subnet[count.index].id
  security_groups   = [aws_security_group.clustersg.id]
  key_name          = aws_key_pair.demo_key_pair.key_name
  associate_public_ip_address = "false"
  tags = {
    terraform = "true"
    name      = "Django-todo-${count.index}"
  }
 
        
  

}



