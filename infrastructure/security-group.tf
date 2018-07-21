# W A R N I N G

# This will create stoopid open ec2's, play, and destroy quickly or better... fix

resource "aws_security_group" "play-security-group" {
  description = "Allow HTTP & SSH ingress and all egress"

  # Expose port 80 to allow http traffic
  ingress {
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow SSH into the instance
  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow the instance to communicate outbound, to install git and clone the repo for example
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
