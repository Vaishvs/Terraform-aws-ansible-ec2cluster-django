resource "aws_instance" "ec2_instance" {

  availability_zone = "us-east-1a"
  ami             = "ami-069223a2617758d69"#"ami-0854b52d6f4539dfc"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.cluster_subnet_a.id
  security_groups = [aws_security_group.clustersg.id]
  key_name          = aws_key_pair.demo_key_pair.key_name
  tags = {
    terraform = "true"
    name      = "Django-todo-master-ansible-server"
  }

}


