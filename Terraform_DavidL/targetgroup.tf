resource "aws_lb_target_group" "this" {
  name     = "this"
  port     = "80"
  vpc_id   =data.aws_vpc.default.id
  protocol = "HTTP"

  health_check {
    enabled = true
    matcher = 200
    path    = "/"
    port = "80"
    protocol ="HTTP"
  }
}

resource "aws_lb_target_group_attachment" "attach1" {
    count = 3
    target_group_arn = aws_lb_target_group.this.arn
    target_id        = aws_instance.Crash_Server_[count.index].id
    port             = "80"
}

resource "aws_alb_listener" "this" {
  count = 3
  load_balancer_arn = aws_lb.Crash_Server_lb_s[count.index].arn
  port = "80"
  protocol = "HTTP"

  default_action {
    target_group_arn =aws_lb_target_group.this.arn
    type = "forward"
  }
  
}