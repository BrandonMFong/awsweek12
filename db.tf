resource "aws_db_subnet_group" "week12-db-subnet-group" {
  name       = "wee12-db-subnet-group"
  subnet_ids = [aws_subnet.week12-pri-a.id]

  tags = {
    Name = "week12 db subnet"
  }
}

