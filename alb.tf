##################################################
# LB in Pub subnet
##################################################

resource "aws_lb" "web_lb" {
  name               = "web-lb"
  internal           = false
  load_balancer_type = "application"
  subnets            = aws_subnet.pub_subnet[*].id
  enable_deletion_protection = false
  tags     = local.common_tags
}

##################################################
# LB Target Group
##################################################

resource "aws_alb_target_group" "tg" {
  name     = "web-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id

  # Health check configuration
  health_check {
    path                = "/health"  
    interval            = 30
    timeout             = 10
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

##################################################
# AutoScaling Attachment
##################################################

resource "aws_autoscaling_attachment" "asg_ass" {
  autoscaling_group_name = aws_autoscaling_group.asg.id
  lb_target_group_arn = aws_alb_target_group.tg.arn
  
}

##################################################
# LB Listener
##################################################

resource "aws_lb_listener" "web_lb_listener" {
  load_balancer_arn = aws_lb.web_lb.arn
  port             = 80
  protocol         = "HTTP"

  default_action {
    type             = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      status_code  = "200"
    }
  }
}