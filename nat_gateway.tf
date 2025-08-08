# 1. Elastic IP for NAT Gateway
resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

# 2. NAT Gateway in a Public Subnet
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.fola_public_subnet_1.id # Use your public subnet ID
  tags = {
    Name = "NAT-Gateway"
  }
}

