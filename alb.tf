# resource "aws_lb" "alb" {
#   name               = "todo-alb"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [data.aws_security_group.selected.id]
#   subnets            = [data.aws_subnet.selected.id]

#   enable_deletion_protection = true

#   tags = {
#     environment = "production"
#   }
# }