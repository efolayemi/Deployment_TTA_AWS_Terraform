resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.fola_vpc.id

  tags = {
    Name = "Apache_IGW"
  }
}


