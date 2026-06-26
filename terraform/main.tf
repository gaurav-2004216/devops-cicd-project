resource "aws_instance" "devops_server" {
  ami           = "ami-xxxxxxxx"
  instance_type = "t3.medium"

  tags = {
    Name = "DevOps-Server"
  }
}
