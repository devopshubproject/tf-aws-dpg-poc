##################################################
# locals for tagging
##################################################

locals {
  common_tags = {
    Owner       = var.owner
    Environment = var.environment
    Cost_center = var.cost_center
    Application = var.app_name
  }
}

##################################################
# launch Config
##################################################

resource "aws_launch_configuration" "ec2_launch" {
  name_prefix          = "poc-web-"
  image_id             = var.ami
  instance_type        = var.instance_type
  key_name             = aws_key_pair.ssh.key_name
  security_groups      = [aws_security_group.sg.id]
  user_data            = filebase64("${path.module}/scripts/init.sh")
  associate_public_ip_address = false
  iam_instance_profile = aws_iam_instance_profile.session_manager.id
  enable_monitoring    = true
}