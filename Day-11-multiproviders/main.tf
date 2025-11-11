resource "aws_instance" "name" {
  ami="ami-0cae6d6fe6048ca2c" 
  instance_type = "t3.micro"
  tags = {
    Name = "public-ec2"
  }
}

# create  (us-east-1) region

resource "aws_s3_bucket" "name" {
    bucket = "tybuwbdsjbcscjyesgyfuhuy"
    provider = aws.oregon 
}

# create  (ap-south-1) region

# ------- region specific creation process -----