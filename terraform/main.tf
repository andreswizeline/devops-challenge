module "ecs" {
  source = "./ecs"

  vpc_id                 = aws_vpc.main.id
  cluster_name           = var.cluster_name
  ecs_task_execution_role = aws_iam_role.ecs_task_execution_role.arn
  container_name         = var.container_name
  container_port         = var.container_port
  image                  = var.image # Replace with your image
}

resource "aws_iam_role" "ecs_task_execution_role" {
  name = var.ecs_task_execution_role

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_role" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}