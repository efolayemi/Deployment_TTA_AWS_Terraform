#Web server with 2 EC2 Instances

# Get latest Amazon Linux 2 AMI
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

#Web Server 1 in Public Subnet 1
resource "aws_instance" "web_server_1" {
  ami                         = data.aws_ami.amazon_linux_2.id
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.fola_public_subnet_1.id
  vpc_security_group_ids      = [aws_security_group.web_SG.id]
  associate_public_ip_address = true
  user_data                   = file("userdata.sh")
  key_name = var.keyname

  tags = {
    Name = "web-server-1"
  }
}


#Web Server 1 in Public Subnet 2
resource "aws_instance" "web_server_2" {
  ami                         = data.aws_ami.amazon_linux_2.id
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.fola_public_subnet_2.id
  vpc_security_group_ids      = [aws_security_group.web_SG.id]
  associate_public_ip_address = true
  user_data                   = file("userdata.sh")
  key_name = var.keyname

  tags = {
    Name = "web-server-2"
  }
}

# 3. MySQL Database EC2 in Private Subnet
resource "aws_instance" "db_server" {
  ami                    = data.aws_ami.amazon_linux_2.id
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.fola_private_subnet.id
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  associate_public_ip_address = false

  tags = {
    Name = "mysql-db-server"
  }
}