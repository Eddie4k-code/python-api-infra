resource "aws_internet_gateway" "example_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "example-igw"
  }
}

resource "aws_route_table" "example_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.example_igw.id
  }

  tags = {
    Name = "example-route-table"
  }
}


resource "aws_route_table_association" "subnet1" {
  subnet_id      = aws_subnet.us-west-1a
  route_table_id = aws_route_table.example_route_table.id
}

resource "aws_route_table_association" "subnet2" {
  subnet_id      = aws_subnet.us-west-1c
  route_table_id = aws_route_table.example_route_table.id
}