resource "aws_instance" "name" {
  ami = "ami-0bdd88bd06d16ba03"
  instance_type = "t3.micro"
  tags = {
    Name = "Lifecycle"
  }

lifecycle {
  # Enables replacement by creating new before destroying old
  #create_before_destroy = true

  # Ignores changes to tags to avoid unnecessary updates
  #ignore_changes        = [tags]

  # Prevents accidental deletion of the resource
 # prevent_destroy       = true
}
}
