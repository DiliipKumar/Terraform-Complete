# outputs.tf

output "ecs_cluster_arn" {
  description = "The ARN of the ECS Cluster"
  value       = aws_ecs_cluster.this.arn
}

output "ecs_service_arn" {
  description = "The ARN of the ECS Service"
  value       = aws_ecs_service.this.arn
}

output "ecs_task_definition_arn" {
  description = "The ARN of the ECS Task Definition"
  value       = aws_ecs_task_definition.this.arn
}
