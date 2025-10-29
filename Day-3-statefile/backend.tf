terraform {
  backend "s3" {
    bucket = "resouce-bucket"
    key = "terraform.tfstate"
    region = "us-east-1"
    
  }
}