resource "aws_autoscaling_group" "as_gr" {
  name                 = "my-autoscaling-group"
  launch_configuration = aws_launch_configuration.my_launch_config.name
  vpc_zone_identifier  = [aws_subnet.mySubnet.id]

  desired_capacity     = 2
  max_size             = 10
  min_size             = 2 
  health_check_type    = "EC2"

  tag {
    key                 = "Name"
    value               = "as1-instance"
    propagate_at_launch = true
  }
}

