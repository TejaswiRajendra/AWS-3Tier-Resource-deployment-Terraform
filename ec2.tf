resource "aws_instance" "web" {
  ami             = "ami-08b5b3a93ed654d19"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.public_subnet_1.id
  security_groups = [aws_security_group.web_sg.id]  # Changed to .id
  key_name        = var.key_name
  tags = {
    Name = "public-TF-Web"
  }
}

resource "aws_instance" "App" {
  ami             = "ami-08b5b3a93ed654d19"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.private_subnet_1.id
  security_groups = [aws_security_group.app_sg.id]  # Changed to .id
  key_name        = var.key_name
  tags = {
    Name = "private-TF-app"
  }
}