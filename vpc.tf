resource "aws_vpc" "main-vpc" {
  cidr_block       = "${var.vpc_cidr}"
  tags {
    Name = "nat-vpc"
  }
}
resource "aws_subnet" "main-subnet" {
  vpc_id     = "${aws_vpc.main-vpc.id}"
  cidr_block = "${var.subnet_cidr.["0"]}"
  availability_zone = "${var.azs.["0"]}"

  tags {
    Name = "public-subnet"
  }
}
resource "aws_subnet" "main-subnet1" {
  vpc_id     = "${aws_vpc.main-vpc.id}"
  cidr_block = "${var.subnet_cidr.["1"]}"
  availability_zone = "${var.azs.["1"]}"

  tags {
    Name = "private-subnet"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.main-vpc.id}"

  tags {
    Name = "nat-igw"
  }
}
resource "aws_route_table" "r" {
  vpc_id = "${aws_vpc.main-vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }
  tags {
    Name = "public-rt"
  }
}
resource "aws_route_table" "rt" {
  vpc_id = "${aws_vpc.main-vpc.id}"
  route {
   cidr_block = "0.0.0.0/0"
   instance_id = "${aws_instance.nat.id}"
 }
  tags {
    Name = "private-rt"
  }
}
resource "aws_route_table_association" "a" {
  subnet_id      = "${aws_subnet.main-subnet1.id}"
  route_table_id = "${aws_route_table.rt.id}"
}

resource "aws_route_table_association" "pub" {
  subnet_id      = "${aws_subnet.main-subnet.id}"
  route_table_id = "${aws_route_table.r.id}"
}
