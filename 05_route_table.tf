resource "aws_route_table" "my-rtw" {
  vpc_id = aws_vpc.myVpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "my-rtw"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.mySubnet.id
  route_table_id = aws_route_table.my-rtw.id
}
resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.mySubnet2.id
  route_table_id = aws_route_table.my-rtw.id
}