resource "aws_instance" "ec2_instance" {

  ami             = "ami-080e1f13689e07408"#"ami-0854b52d6f4539dfc"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.cluster_subnet[0].id
  security_groups = [aws_security_group.clustersg.id]
  key_name          = aws_key_pair.demo_key_pair.key_name
  tags = {
    terraform = "true"
    name      = "Django-todo-master-ansible-server"
  }

}

