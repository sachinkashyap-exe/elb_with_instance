resource "aws_subnet" "mySubnet" {
  vpc_id     = aws_vpc.myVpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "mySubnet"
  }
  }

resource "aws_subnet" "mySubnet2" {
  vpc_id     = aws_vpc.myVpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "mySubnet2"
  }
  }