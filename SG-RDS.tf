resource "aws_db_instance" "db_sg" {
  identifier             = "terraform-rds-instance"
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "8.0.35"
  instance_class         = "db.t3.micro"
  username               = var.db_username
  password               = var.db_password
  publicly_accessible    = false
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.my_subnet_group.name
  tags = {
    Name = "TF-RDS-Instance"
  }
}

resource "aws_db_subnet_group" "my_subnet_group2" {
  name       = "my-subnet-group2"
  subnet_ids = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
  tags = {
    Name = "TF-DB-Subnet-Group"
  }
}