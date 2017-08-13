provider "aws" {
  region = "eu-west-1"
}

output "public_ip" {
  value = "${aws_instance.play-instance.public_ip}"
}

resource "aws_security_group" "play-security-group" {
  name = "play-security-group"
  # Expose port 80 to allow http traffic
  ingress {
    from_port = "80"
    to_port = "80"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # Allow SSH into the instance
  ingress {
    from_port = "22"
    to_port = "22"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 
  # Allow the instance to communicate outbound, to install git and clone the repo for example
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }  
}

resource "aws_instance" "play-instance" {
  tags {
    Name = "play-instance"
  }  
  ami = "ami-d7b9a2b1"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.play-security-group.id}"] 
  # AWS key name passed in as variable
  key_name = "${var.aws_key}"
}