resource "aws_instance" "app" {
  ami                    = var.ami
  instance_type          = "t2.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.sg_id]

  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl enable httpd
              systemctl start httpd
              echo "<h1>${var.name} Web Server is Live</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name = var.name
  }
}


