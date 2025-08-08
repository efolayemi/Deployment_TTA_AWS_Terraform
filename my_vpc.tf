provider "aws" {
  region = var.region
}
resource "aws_vpc" "fola_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  instance_tenancy     = "default"

  tags = {
    Name = "Fola_vpc"
  }
}