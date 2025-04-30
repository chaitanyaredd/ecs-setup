# --- ECS Task Definition ---
resource "aws_ecs_task_definition" "awfiz_task_def" {
  family                   = "awfiz_task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "512"    # Task-level CPU (0.5 vCPU)
  memory                   = "1024"   # Task-level Memory (1 GB)
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = jsonencode([
    {
      name      = "awfiz"
      image     = "nginx:latest"    # Todo - Update the correct docker image details
      essential = true
      cpu       = 256               # Container-level CPU (0.25 vCPU)
      memory    = 512               # Hard limit (container killed if exceeded)
      memoryReservation = 256       # Soft limit (container starts here, can burst)
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
          protocol      = "tcp"
        }
      ]
    }
  ])
}
