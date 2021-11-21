resource "aws_launch_template" "week12-bastion-lt" {
  name = "week12-bastion-lt"

  #block_device_mappings {
  #  device_name = "/dev/sda1"
  #
  #  ebs {
  #    volume_size = 20
  #  }
  #}

  #capacity_reservation_specification {
  #  capacity_reservation_preference = "open"
  #}

  #cpu_options {
  #  core_count       = 4
  #  threads_per_core = 2
  #}

  #credit_specification {
  #  cpu_credits = "standard"
  #}

  #disable_api_termination = true

  #ebs_optimized = true

  #elastic_gpu_specifications {
  #  type = "test"
  #}

  #elastic_inference_accelerator {
  #  type = "eia1.medium"
  #}

  #iam_instance_profile {
  #  name = "test"
  #}

  image_id = "ami-02e136e904f3da870"

  #instance_initiated_shutdown_behavior = "terminate"

  #instance_market_options {
  #  market_type = "spot"
  #}

  instance_type = "t2.micro"

  #kernel_id = "test"

  key_name = "ECE592"

  #license_specification {
  #  license_configuration_arn = "arn:aws:license-manager:eu-west-1:123456789012:license-configuration:lic-0123456789abcdef0123456789abcdef"
  #}

  #metadata_options {
  #  http_endpoint               = "enabled"
  #  http_tokens                 = "required"
  #  http_put_response_hop_limit = 1
  #}

  #monitoring {
  #  enabled = true
  #}

  network_interfaces {
  #  associate_public_ip_address = true
    security_groups = [aws_security_group.week12-ssh-sg-v2.id]
    subnet_id = aws_subnet.week12-sub-a.id
  }

  #placement {
  #  availability_zone = "us-west-2a"
  #}

  #ram_disk_id = "test"

  #vpc_security_group_ids = ["sg-12345678"]

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "week12-bastion-lt"
    }
  }

  #user_data = filebase64("${path.module}/example.sh")
}

resource "aws_autoscaling_group" "week12-bastion-asg" {
  availability_zones = ["us-east-1a"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1

  launch_template {
    id      = aws_launch_template.week12-bastion-lt.id
    version = "$Latest"
  }
}
