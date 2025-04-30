# Define the Application Load Balancer
resource "aws_lb" "awfiz_alb" {
  name               = "awsfiz-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web_sg.id]
  subnets            = [aws_subnet.public_a.id, aws_subnet.public_b.id]
}

