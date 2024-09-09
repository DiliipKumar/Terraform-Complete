# variables.tf

variable "region" {
  description = "AWS region"
  type        = string
}

variable "cluster_name" {
  description = "ECS cluster name"
  type        = string
}

variable "family" {
  description = "ECS task definition family"
  type        = string
}

variable "container_definitions" {
  description = "ECS container definitions in JSON format"
  type        = string
}

variable "cpu" {
  description = "The number of cpu units used by the task"
  type        = string
}

variable "memory" {
  description = "The amount of memory (in MiB) used by the task"
  type        = string
}

variable "execution_role_arn" {
  description = "The Amazon Resource Name (ARN) of the task execution role"
  type        = string
}

variable "task_role_arn" {
  description = "The Amazon Resource Name (ARN) of the IAM role to use"
  type        = string
}

variable "requires_compatibilities" {
  description = "Launch types required by the task"
  type        = list(string)
}

variable "network_mode" {
  description = "The Docker networking mode to use for the containers in the task"
  type        = string
}

variable "service_name" {
  description = "The name of the ECS service"
  type        = string
}

variable "desired_count" {
  description = "The desired number of instantiations of the task definition to keep running"
  type        = number
}

variable "launch_type" {
  description = "The launch type on which to run your service"
  type        = string
}

variable "subnets" {
  description = "The subnets associated with the task or service"
  type        = list(string)
}

variable "security_groups" {
  description = "The security groups associated with the task or service"
  type        = list(string)
}

variable "assign_public_ip" {
  description = "Whether to assign a public IP address"
  type        = bool
  default     = false
}

variable "target_group_arn" {
  description = "The ARN of the load balancer target group"
  type        = string
}

variable "container_name" {
  description = "The name of the container to associate with the load balancer"
  type        = string
}

variable "container_port" {
  description = "The port on the container to associate with the load balancer"
  type        = number
}
