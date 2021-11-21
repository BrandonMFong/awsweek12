# EC2
/* resource "aws_instance" "week12-bastion-vm" {
  ami           = "ami-02e136e904f3da870"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.week12-sub-b.id

  vpc_security_group_ids = [
    aws_security_group.week12-ssh-sg-v2.id
  ]

  key_name = "ECE592"

  tags = {
    Name = "week12-bastion-vm"
  }
}*/

# worker vm
resource "aws_instance" "week12-worker-vm" {
  ami                  = "ami-0168b9285893a7395"
  instance_type        = "t2.micro"
  subnet_id            = aws_subnet.week12-pri-a.id
  iam_instance_profile = aws_iam_instance_profile.week12-profile-ref.name

  vpc_security_group_ids = [
    aws_security_group.week12-ssh-pri-sg.id
  ]

  key_name = "ECE592"

  user_data = file("cloudinit.txt")

  tags = {
    Name = "week12-worker-vm"
  }
}

# IAM profile ref
resource "aws_iam_instance_profile" "week12-profile-ref" {
  name = "week12-profile-ref"
  role = aws_iam_role.week12-role.name
  tags = {
    Name = "week12-profile-ref"
  }
}
