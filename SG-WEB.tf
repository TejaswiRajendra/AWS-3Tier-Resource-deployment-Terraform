resource "aws_security_group" "web_sg" {
  vpc_id = aws_vpc.my_vpc.id

  # Allow HTTP (80) for public access
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["223.185.134.229/32"]  # Allow from anywhere
  }

  # Allow HTTP (80) for traffic from External LB 
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["aws_security_group.alb_sg.id"]  # Allow from anywhere
  }

  # Allow SSH (22) only from your IP (Replace YOUR_IP)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["223.185.134.229/32"]  # Replace with your public IP
  }

  # Allow all outbound traffic (default egress rule)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "TF-WebAppSG"
  }
}

