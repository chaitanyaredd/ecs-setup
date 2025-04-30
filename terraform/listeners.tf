# Define the Listener for the ALB
resource "aws_lb_listener" "my_listener" {
  load_balancer_arn = aws_lb.awfiz_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.awfiz_target_group.arn
  }
}
