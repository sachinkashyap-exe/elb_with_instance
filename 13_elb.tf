# Create ALB
resource "aws_lb" "example_alb" {
  name               = "example-alb"
  subnets            = [aws_subnet.mySubnet.id, aws_subnet.mySubnet2.id]
  security_groups    = [aws_security_group.allow_tls.id]
  internal           = false
  load_balancer_type = "application"
}

# Create Target Group
resource "aws_lb_target_group" "example_target_group" {
  name        = "example-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.myVpc.id
  target_type = "instance"
}

# Attach Target Group to ALB
resource "aws_lb_target_group_attachment" "example_attachment" {
  target_group_arn = aws_lb_target_group.example_target_group.arn
  target_id        = aws_instance.s1.id  # Replace with your instance ID
}

# Create ALB listener
resource "aws_lb_listener" "example_listener" {
  load_balancer_arn = aws_lb.example_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.example_target_group.arn
  }
}