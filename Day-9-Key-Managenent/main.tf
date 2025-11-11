# Key Pair
resource "aws_key_pair" "example" {
  key_name   = "public-key"
  public_key = file("~/.ssh/id_ed25519.pub")
}


resource "aws_instance" "server" {
  ami                         = "ami-0bdd88bd06d16ba03" # Ubuntu AMI
  instance_type               = "t3.micro"
  key_name                    = aws_key_pair.example.key_name
  
}

# mobastrem inside  give private key id 
# and give instance public id 
# then connct & run in mobastrem