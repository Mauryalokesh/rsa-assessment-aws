resource "aws_instance" "web" {
  ami                    = "ami-05238ab1443fdf48f" # Ubuntu 22.04 LTS in eu-west-2
  instance_type          = "t2.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.sg_id]
  #key_name               = "your-key-name" # Optional: Replace with your key pair
  tags = {
    Name = "rsa-web-instance"
  }
}
