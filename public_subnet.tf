resource "aws_subnet" "fola_public_subnet_1" {
  vpc_id                  = aws_vpc.fola_vpc.id
  cidr_block              = "10.0.0.0/18"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-west-2a"

  tags = {
    Name = "Apache_Public_Subnet"
  }
}

resource "aws_subnet" "fola_public_subnet_2" {
  vpc_id                  = aws_vpc.fola_vpc.id
  cidr_block              = "10.0.64.0/18"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-west-2b"

  tags = {
    Name = "Apache_Public_Subnet2"
  }
}


resource "aws_subnet" "fola_private_subnet" {
  vpc_id                  = aws_vpc.fola_vpc.id
  cidr_block              = "10.0.128.0/17"
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-west-2c"

  tags = {
    Name = "Apache_Private_Subnet"
  }
}