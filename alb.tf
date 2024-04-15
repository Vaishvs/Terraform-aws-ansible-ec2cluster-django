resource "aws_lb_target_group" "my_tg_a" { // Target Group A
 name     = "target-group-a"
 port     = 80
 protocol = "HTTP"
 vpc_id   = aws_vpc.clustervpc.id
}

resource "aws_lb_target_group_attachment" "tg_attachment_a" {
 count            = length(aws_instance.ec2_workernode)
 target_group_arn = aws_lb_target_group.my_tg_a.arn
 target_id        = aws_instance.ec2_workernode[count.index].id
 port             = 80
}

resource "aws_lb" "test_alb" {
  name               = "ansible-cluster-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.clustersg.id]
  subnets           = [aws_subnet.cluster_subnet_a.id, aws_subnet.cluster_subnet_b.id,aws_subnet.cluster_subnet_c.id]#[for subnet in aws_subnet.cluster_subnet : subnet.id]

  enable_deletion_protection = true

  tags = {
    Environment = "dev"
  }
}


resource "aws_lb_listener" "my_alb_listener" {
#  count            = length(aws_instance.ec2_workernode)   
 load_balancer_arn = aws_lb.test_alb.arn
 port              = "80"
 protocol          = "HTTP"

 default_action {
   type             = "forward"
   target_group_arn = aws_lb_target_group.my_tg_a.arn
 }
}