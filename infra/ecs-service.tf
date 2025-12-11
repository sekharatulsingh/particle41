resource "aws_ecs_task_definition" "simple_time" {
  family                   = "simpletimetask"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512

  execution_role_arn = aws_iam_role.ecs_execution_role.arn

  container_definitions = jsonencode([
    {
      name      = "simpletimeservice"
      image     = var.container_image  # e.g.: "youruser/simpletimeservice:latest"
      cpu       = 256
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 8080
          protocol      = "tcp"
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "simple_time" {
  name            = "simpletimeservice"
  cluster         = module.ecs_cluster.cluster_id
  task_definition = aws_ecs_task_definition.simple_time.arn
  desired_count   = 2
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = module.vpc.private_subnets
    security_groups = [aws_security_group.ecs_tasks.id]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.simple_time_tg.arn
    container_name   = "simpletimeservice"
    container_port   = 8080
  }

  depends_on = [
    aws_lb_listener.http
  ]
}
