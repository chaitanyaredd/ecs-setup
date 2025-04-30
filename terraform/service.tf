# --- ECS Service ---
resource "aws_ecs_service" "awfiz_service" {
  name            = "awfiz_service"
  cluster         = aws_ecs_cluster.fargate_cluster.id  # Replace with your ECS cluster name
  task_definition = aws_ecs_task_definition.awfiz_task_def.arn
  desired_count   = 2
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = [aws_subnet.public_a.id, aws_subnet.public_b.id]  # Replace with actual subnet IDs
    assign_public_ip = true
    security_groups = [aws_security_group.web_sg.id]  # Replace with a valid security group
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.awfiz_target_group.arn
    container_name   = "awfiz"
    container_port   = 80
  }

  depends_on = [aws_iam_role_policy_attachment.ecs_task_execution_policy]
}
