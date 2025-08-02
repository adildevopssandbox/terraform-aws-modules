resource "aws_db_subnet_group" "rds_subnet" {
  name       = var.rds_subnet_group_name
  subnet_ids = var.subnet_ids
}

resource "aws_db_instance" "rds" {
  allocated_storage      = 10
  db_name                = "mydb"
  engine                 = "postgres"
  engine_version         = "15.13"
  instance_class         = "db.t3.micro"
  username               = var.db_username
  password               = var.db_password
  vpc_security_group_ids = [var.rds_sg_id]
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet.name
  parameter_group_name   = "default.postgres15"
  skip_final_snapshot    = true

  tags = {
    Name = "postgres-rds"
  }
}