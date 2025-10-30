terraform {
  backend "s3" {
    bucket = "source-bucket-dxv"
    key = "day-4/terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true    #to use s3 native locking
  }
}