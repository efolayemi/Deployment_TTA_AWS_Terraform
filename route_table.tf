# Created the public route table

resource "aws_route_table" "fola_public_route_table" {
  vpc_id = aws_vpc.fola_vpc.id
  tags = {
    Name = "Public_Route_Table"

  }
}

#Route the Public RT to IGW
resource "aws_route" "public_internet_access" {
  route_table_id         = aws_route_table.fola_public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.IGW.id
}

#Step 3 - Task 2: Associate the public subnets with this route table

resource "aws_route_table_association" "pub_rt_assoc" {
  subnet_id      = aws_subnet.fola_public_subnet_1.id
  route_table_id = aws_route_table.fola_public_route_table.id
}


#Step3 - Task 3: create a private route table for the NAT Gateway to route outbound traffic for private subnet instances

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.fola_vpc.id
  tags = {
    Name = "private_route_table"
  }
}

# Add route to the NAT Gateway for outbound internet access
resource "aws_route" "private_route_to_nat" {
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gw.id
}


# Associate the route table with the private subnet
resource "aws_route_table_association" "private_subnet_association" {
  subnet_id      = aws_subnet.fola_private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}