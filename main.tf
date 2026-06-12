data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_vpc" "challenge_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  azs                  = data.aws_availability_zones.available.names

  tags {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public" {
  vpd_id             = aws_vpc.challenge_vpc.id
  cidr_block         = var.public_subnet_cidrs
  availability_zones = var.availability_zones
  count              = length(var.public_subnet_count)

  tags {
    Name = "${var.vpc_name}-public-${count.index + 1}"
  }
}

resource "aws_subnet" "private" {
  vpc_id             = aws_vpc.challenge_vpc.id
  cidr_block         = var.private_subnet_cidrs
  availability_zones = var.availability_zones
  count              = length(var.private_subnet_count)

  tags {
    Name = "${var.vpc_name}-private-${count.index + 1}"
  }
}

resource "aws_internet_gateway" "chal-IGW" {
  vpc_id = aws_vpc.challenge_vpc.id

  tags {
    Name = "${var.vpc_name}-IGW"
  }
}

resource "aws_nat_gateway" "chal-nat" {
  subnet_id = aws_subnet.private.id

  tags {
    Name = "Private-NAT-GW"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.callange_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.chal-IGW.id
  }
}

resource "aws_route_table" "private" {
  count  = length(aws_subnet.private)
  vpc_id = aws_vpc.challenge_vpc.id
  route {
    cidr_block    = "0.0.0.0./0"
    nat_gatway_id = var.single_nat_gateway
  }
}
