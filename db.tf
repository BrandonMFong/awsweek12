resource "aws_db_subnet_group" "week12-db-subnet-group" {
  name       = "wee12-db-subnet-group"
  subnet_ids = [aws_subnet.week12-pri-a.id, aws_subnet.week12-pri-b.id]

  tags = {
    Name = "week12 db subnet"
  }
}

# Cluster
resource "aws_rds_cluster" "week12-rds" {
  cluster_identifier      = "week12-rds"
  engine                  = "aurora-mysql"
  engine_mode 		  = "serverless"
  #engine_version          = "5.7.mysql_aurora.2.03.2"
  availability_zones      = ["us-east-1a"]
  database_name           = "week12_rds"
  master_username         = "admin"
  master_password         = "secret123"
  #backup_retention_period = 5
  #preferred_backup_window = "07:00-09:00"
  skip_final_snapshot     = true 
  db_subnet_group_name    = aws_db_subnet_group.week12-db-subnet-group.name
  vpc_security_group_ids  = [aws_security_group.week12-rds-sg.id]
  
  scaling_configuration {
    auto_pause               = true
    max_capacity             = 2
    min_capacity             = 1
    seconds_until_auto_pause = 300
    timeout_action           = "ForceApplyCapacityChange"
  }
}

