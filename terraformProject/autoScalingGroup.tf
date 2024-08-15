# Create Auto Scaling Group
resource "aws_autoscaling_group" "asg" {
  name = "example-asg"
  vpc_zone_identifier = [
    aws_subnet.private_subnet_az1.id,
    aws_subnet.private_subnet_az2.id
  ]
  max_size             = 4
  min_size             = 2
  desired_capacity     = 2
  health_check_type    = "ELB"
  health_check_grace_period = 300
  

  launch_template {
    id      = aws_launch_template.foobar.id
    version = "$Latest"
  }

  instance_maintenance_policy {
    min_healthy_percentage = 90
    max_healthy_percentage = 120
  }
tag {
    key                 = "Name"
    value               = "example-instance"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_launch_template" "foobar" {
  name_prefix   = "foobar"
  image_id      = "ami-0e670eb768a5fc3d4"
  instance_type = "t2.micro"
  key_name = "dineshkey"
}