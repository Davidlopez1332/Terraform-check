resource "aws_lb" "Crash_Server_lb_s" {
  name               = "CrashServerlb"
  internal           = false
  ip_address_type    ="ipv4"
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.lab-alb1.id}"]
  count              = length(var.availability_zones)
  subnets            = [data.aws_subnet.az_1.id, data.aws_subnet.az_2.id, data.aws_subnet.az_3.id]

  tags = {
    Name = "lab-alb"
  }
}

