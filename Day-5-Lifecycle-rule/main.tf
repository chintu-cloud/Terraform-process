resource "aws_instance" "name" {
  ami = "ami-0bdd88bd06d16ba03"
  instance_type = "t3.micro"
  tags = {
    Name = "Lifecycle"
  }

lifecycle {

  # -----create befote destroy--------
  # Enables replacement by creating new before destroying old
  # create_before_destroy = true



# --------ignore changes ---------
  # Ignores changes to tags to avoid unnecessary updates
  #ignore_changes        = [tags]

# Examples:
  ### if you can change tags inside value, this ingnore lifecycle rule can ignore/skip the value, what you add value 
  ##  ex: tags{
  #         Name = "cloud"
  #               / "dev"
  #   }
  #   result: Name = "cloud"
  # this ingnore lifecycle rule can ignore/skip the "dev" value 




# --------prevent destroy -------
  # Prevents accidental deletion of the resource
  # prevent_destroy       = true

  # it means you can enable this option instance not terminated,
  # if u can't terminate instnce until when you disable this option 
}
}
