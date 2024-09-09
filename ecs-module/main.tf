module "ecs_service" {
  source               = "./modules/ecs-module"
  region               = "us-west-1"
  cluster_name         = "my-cluster"
  family               = "my-task-family"
  container_definitions = jsonencode([
    {
      name      = "my-app"
      image     = "nginx:latest"
      cpu       = 512
      memory    = 1024
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])
  cpu                  = "256"
  memory               = "512"
  execution_role_arn   = "arn:aws:iam::123456789012:role/execution-role"
  task_role_arn        = "arn:aws:iam::123456789012:role/task-role"
  requires_compatibilities = ["FARGATE"]
  network_mode         = "awsvpc"
  service_name         = "my-service"
  desired_count        = 2
  launch_type          = "FARGATE"
  subnets              = ["subnet-0123456789abcdef0"]
  security_groups      = ["sg-0123456789abcdef0"]
  assign_public_ip     = true
  target_group_arn     = "arn:aws:elasticloadbalancing:us-west-1:123456789012:targetgroup/my-target-group"
  container_name       = "my-app"
  container_port       = 80
}
