resource "aws_lb" "external_alb" {
  name               = "external-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
  enable_deletion_protection = false
  tags = {
    Name = "TF-External-ALB"
  }
}

resource "aws_lb_target_group" "external_alb_tg" {
  name     = "external-alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.my_vpc.id
  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
  tags = {
    Name = "TF-External-ALB-TG"
  }
}

resource "aws_lb_listener" "external_alb_listener" {
  load_balancer_arn = aws_lb.external_alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.external_alb_tg.arn
  }
}

resource "aws_lb_target_group_attachment" "external_alb_attachment" {
  target_group_arn = aws_lb_target_group.external_alb_tg.arn
  target_id        = aws_instance.web.id
  port             = 80
}