resource "aws_launch_configuration" "lc_home" {
  name           = "${var.project}-lc_home"
  image_id       = var.image_id
  instance_type  = var.instance_type
  key_name       = var.key_pair
  security_groups = var.sg_ids
  user_data = <<-EOF
    #!/bin/bash
    yum install httpd -y
    systemctl start httpd
    systemctl enable httpd
    echo "<h1>$HOSTNAME-this is home page</h1>" > /var/www/html/index.html
  EOF
}

resource "aws_launch_configuration" "lc_mobile" {
  name           = "${var.project}-lc_mobile"
  image_id       = var.image_id
  instance_type  = var.instance_type
  key_name       = var.key_pair
  security_groups = var.sg_ids
  user_data = <<-EOF
      #!/bin/bash
      yum install httpd -y
      systemctl start httpd
      systemctl enable httpd
      echo "<h1>$HOSTNAME- this is mobile page</h1>" > /var/www/html/index.html
  EOF
}
resource "aws_autoscaling_group" "as_home" {
  name                 = "${var.project}-as_home"
  launch_configuration = aws_launch_configuration.lc_home.name
  min_size             = 1
  max_size             = 2
  desired_capacity    = 2
  vpc_zone_identifier = [var.subnet1, var.subnet2]
  tag {
    key = "Name"
    value = "${var.project}-home-app"
    propagate_at_launch = true
  }
}
resource "aws_autoscaling_policy" "asp_home" {
  name                   = "${var.project}-asp_home"
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = aws_autoscaling_group.as_home.name
  policy_type = "TargetTrackingScaling"
    target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 40.0
  }
}

resource "aws_autoscaling_group" "as_mobile" {
  name                 = "${var.project}-as_mobile"
  launch_configuration = aws_launch_configuration.lc_mobile.name
  min_size             = 1
  max_size             = 2
  desired_capacity    = 2
  vpc_zone_identifier = [var.subnet1, var.subnet2]
  tag {
    key = "Name"
    value = "${var.project}-mobile-app"
    propagate_at_launch = true
  }
  
}
resource "aws_autoscaling_policy" "asp_mobile" {
  name                   = "${var.project}-asp_mobile"
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = aws_autoscaling_group.as_mobile.name
  policy_type = "TargetTrackingScaling"
    target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 40.0
  }
}