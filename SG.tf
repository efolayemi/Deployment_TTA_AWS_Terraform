#Web server security group (allow HTTP + SSH)
resource "aws_security_group" "web_SG" {
  name        = "web_tf_SG"
  description = "Allow all SSH & HTTP"
  vpc_id = aws_vpc.fola_vpc.id

  ingress {
    description = "SSH"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTP"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Web_SG"
  }
}

#Database SG (allow MYSQL from web servers only)
resource "aws_security_group" "db_sg" {
    name = "db_sg"
    description = "Allow MYSQL from web servers"
    vpc_id = aws_vpc.fola_vpc.id 

    ingress {
    description = "MySQL from Web SG"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_groups = [aws_security_group.web_SG.id]
    }

egress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
}

tags = {
Name = "db_SG"
}
}
