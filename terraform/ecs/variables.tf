variable "vpc_id" {}
variable "subnet_ids" {
  type = list(string)
}
variable "cluster_name" {}
variable "ecs_task_execution_role" {}
variable "container_name" {}
variable "container_port" {}
variable "image" {}