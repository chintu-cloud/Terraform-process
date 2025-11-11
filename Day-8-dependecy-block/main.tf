# Variables
variable "instance_type" {
  type    = string
  default = "t3.micro"  # Free Tier eligible
}

variable "ami_id" {
  type    = string
  default = "ami-0bdd88bd06d16ba03"  # Amazon Linux 2
}

# Random suffix for S3 bucket to ensure uniqueness
resource "random_id" "bucket_suffix" {
  byte_length = 4
}

# S3 Bucket
resource "aws_s3_bucket" "name" {
  bucket = "my-bucket-${random_id.bucket_suffix.hex}"

  tags = {
    Name = "MyBucket"
  }
}

# EC2 Instance
resource "aws_instance" "name" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "prod-instance"
  }

  # Ensure the EC2 instance is created after the S3 bucket
  depends_on = [aws_s3_bucket.name]
}
