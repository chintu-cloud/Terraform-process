resource "aws_instance" "name" {
  ami = "ami-07860a2d7eb515d9a"
  instance_type = "t3.micro"
  tags = {
    Nmae = "Touch-EC2"
  }
}