# ---------------------------
# Create VPC
# ---------------------------
resource "aws_vpc" "cloud_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "cloud-vpc"
  }
}

# ---------------------------
# Create Subnets
# ---------------------------
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.cloud_vpc.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet-public"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.cloud_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "subnet-private"
  }
}

# ---------------------------
# Create Internet Gateway
# ---------------------------
resource "aws_internet_gateway" "cloud_igw" {
  vpc_id = aws_vpc.cloud_vpc.id
  tags = {
    Name = "cloud-IG"
  }
}

# ---------------------------
# Create Public Route Table
# ---------------------------
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.cloud_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.cloud_igw.id
  }

  tags = {
    Name = "public-RT"
  }
}

# Associate Public Route Table with Public Subnet
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

# ---------------------------
# Create Security Group
# ---------------------------
resource "aws_security_group" "cloud_sg" {
  name   = "allow-tls"
  vpc_id = aws_vpc.cloud_vpc.id

  tags = {
    Name = "cloud-SG"
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ---------------------------
# Create Elastic IP for NAT
# ---------------------------
resource "aws_eip" "nat_eip" {
  domain = "vpc"

  tags = {
    Name = "Nat-ElasticIP"
  }
}

# ---------------------------
# Create NAT Gateway
# ---------------------------
resource "aws_nat_gateway" "cloud_nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "cloud-nat"
  }

  depends_on = [aws_internet_gateway.cloud_igw]
}

# ---------------------------
# Create Private Route Table
# ---------------------------
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.cloud_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.cloud_nat.id
  }

  tags = {
    Name = "private-RT"
  }
}

# Associate Private Route Table with Private Subnet
resource "aws_route_table_association" "private_assoc" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_rt.id
}

# ---------------------------
# Create EC2 Instances
# ---------------------------

# Public EC2 instance
resource "aws_instance" "public_ec2" {
  ami                         = "ami-0bdd88bd06d16ba03"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.cloud_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "Public-EC2"
  }
}

# Private EC2 instance
resource "aws_instance" "private_ec2" {
  ami                    = "ami-0bdd88bd06d16ba03"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.private_subnet.id
  vpc_security_group_ids = [aws_security_group.cloud_sg.id]
  associate_public_ip_address = false

  tags = {
    Name = "Private-EC2"
  }
}
