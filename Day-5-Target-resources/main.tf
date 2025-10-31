resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "cloud-vpc"
    }
  
}

resource "aws_subnet" "name" {
    vpc_id = aws_vpc.name.id
    cidr_block = "10.0.0.0/24"
    tags = {
        Name = "subnet-cloud"
    }
  
}

# we can use specific resource in case we use target resource.
# target resource we can user to apply specific resource level only below command is the reference
        # terraform plan -target=aws_vpc.name
        # terraform apply -target=aws_vpc.name
        # terraform destroy -target=aws_vpc.name
