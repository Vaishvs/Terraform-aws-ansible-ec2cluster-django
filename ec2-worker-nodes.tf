# resource "aws_instance" "ec2_workernode" {

#    count                       = 3
#    availability_zone      = element(["us-east-1a", "us-east-1b"], count.index % 2)
#    ami             = "ami-069223a2617758d69"#"ami-0854b52d6f4539dfc"
#   instance_type   = "t2.micro"
#  subnet_id = "${aws_subnet.cluster_subnet_" + element(["a", "b"], count.index % 2) + ".id"}"


#   security_groups   = [aws_security_group.clustersg.id]
#   key_name          = aws_key_pair.demo_key_pair.key_name
  
#   associate_public_ip_address = "false"
#   tags = {
#     terraform = "true"
#     name      = "Django-todo-workernode-${count.index}"
#   }
 
        
  

# }



resource "aws_instance" "ec2_workernode" {
  count                        = 3
  availability_zone            = var.availability_zone1[count.index % length(var.availability_zone1)] #(["us-east-1a", "us-east-1b"], count.index % 2)
  ami                          = "ami-069223a2617758d69"
  instance_type                = "t2.micro"
  #subnet_id                    =  [aws_subnet.cluster_subnet_a.id, aws_subnet.cluster_subnet_b.id,aws_subnet.cluster_subnet_c.id]#"${element(aws_subnet.cluster_subnet_a.*[count.index % 2].id, 0)}"
  subnet_id = element(["aws_subnet.cluster_subnet_a.id", "aws_subnet.cluster_subnet_b.id", "aws_subnet.cluster_subnet_c.id"], count.index)
  security_groups              = [aws_security_group.clustersg.id]
  key_name                     = aws_key_pair.demo_key_pair.key_name
  associate_public_ip_address  = "false"
  tags = {
    terraform = "true"
    name      = "Django-todo-workernode-${count.index}"
  }
}

