resource "aws_instance" "Crash_Server_" {
   count = 3  
   ami = var.ami
   instance_type = var.instance_type
   security_groups = ["${aws_security_group.lab-alb1.name}"]
   tags = {
      Name = "Crash_Server_-${count.index}"
           }
   user_data = <<-EOF

    !/bin/bash
    sudo su
    yum update -y
    yum install httpd -y
    systemct1 start httpd
    systemct1 enable httpd
    echo "<html><h1>Hello world from $(hostname -f)... </h1></html>" 

  EOF
}

