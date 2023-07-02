# Terraform Configuration
# This file defines the infrastructure resources for the Python API.

# Create a VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  # Add other VPC configuration settings
}

# Create subnets within the VPC
resource "aws_subnet" "us-west-1a" {
  vpc_id            = aws_vpc.my_vpc.id
  availability_zone = "us-west-1a"
  cidr_block        = "10.0.1.0/24"
  # Add other subnet configuration settings
}


resource "aws_subnet" "us-west-1c" {
  vpc_id            = aws_vpc.my_vpc
  availability_zone = "us-west-1c"
  cidr_block        = "10.0.1.0/24"
  # Add other subnet configuration settings
}


# Create a security group for the EC2 instance
resource "aws_security_group" "my_security_group" {
  vpc_id = aws_vpc.my_vpc.id


  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow connections from any IP address
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow connections from any IP address
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Allow all outbound traffic
  }

}

# Launch an EC2 instance for the Python API
resource "aws_instance" "my_instance" {
  ami                    = "ami-12345678"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.us-west-1a
  vpc_security_group_ids = [aws_security_group.my_security_group.id]
  # Add other EC2 instance configuration settings
}
