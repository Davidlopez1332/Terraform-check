output "ec2_machines" { 
  value = aws_instance.Crash_Server_.*.arn 
}
