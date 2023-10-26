##################################################
# Autoscaling Group
##################################################

resource "aws_autoscaling_group" "asg" {
  name_prefix          = "web-"
  launch_configuration = aws_launch_configuration.ec2_launch.name
  vpc_zone_identifier  = aws_subnet.private_subnet[*].id
  min_size             = 1
  max_size             = 2
  desired_capacity     = 1
  health_check_type    = "EC2"
  target_group_arns    = [aws_alb_target_group.tg.arn]
  health_check_grace_period = 100

  tag {
    key                 = "Name"
    value               = "web-server-as"
    propagate_at_launch = true
  }
}