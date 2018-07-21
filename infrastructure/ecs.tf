resource "aws_ecs_cluster" "play-cluster" {
  name = "play-cluster"
}

resource "aws_ecs_task_definition" "play-task-definition" {
  family                = "play-task-definition"                       # Name for multiple versions of the task definition
  container_definitions = "${file("task-definitions/dotnetapp.json")}"
}

resource "aws_ecs_service" "play-service" {
  name            = "play-service"
  cluster         = "${aws_ecs_cluster.play-cluster.id}"
  task_definition = "${aws_ecs_task_definition.play-task-definition.arn}"
  desired_count   = 1
}