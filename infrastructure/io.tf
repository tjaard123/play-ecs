provider "aws" {
  region = "eu-west-1"
}

output "public_ip" {
  value = "${aws_instance.play-instance.public_ip}"
}