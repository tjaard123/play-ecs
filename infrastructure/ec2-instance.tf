resource "template_file" "user_data" {
  template = "templates/user_data"

  vars {
    cluster_name = "play-cluster"
  }
}

# resource "aws_instance" "play-instance" {
#   tags {
#     Name = "play-instance"
#   }

#   ami                    = "ami-d7b9a2b1"
#   instance_type          = "t2.micro"
#   vpc_security_group_ids = ["${aws_security_group.play-security-group.id}"]

#   # AWS key name passed in as variable
#   key_name = "${var.aws_key}"
# }

resource "aws_launch_configuration" "ecs_cluster" {
  name          = "ecs_cluster_conf"
  instance_type = "t2.micro"
  image_id      = "ami-d7b9a2b1"

  security_groups = [
    "${aws_security_group.play-security-group.id}",
  ]

  user_data = "${template_file.user_data.rendered}"

  # AWS key name passed in as variable
  key_name = "${var.aws_key}"
}