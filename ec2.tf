##  declaring the NAT INSTANCE detail  ##
resource "aws_instance" "nat" {
    count = "${var.num_nat_instances}"
    ami = "${var.amis.["0"]}"
    instance_type = "${var.instance_type}"
    key_name = "${var.key_name}"
    subnet_id      = "${aws_subnet.main-subnet.id}"
    vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
    associate_public_ip_address = "true"
    source_dest_check = "false"
    tags {
    Name = "instance-nat"
  }
}
##  declaring the PRIVATE INSTANCE detail  ##
resource "aws_instance" "private-ec2" {
    count = "${var.num_private_instances}"
    ami = "${var.amis.["1"]}"
    instance_type = "${var.instance_type}"
    key_name = "${var.key_name}"
    subnet_id      = "${aws_subnet.main-subnet1.id}"
    vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
    associate_public_ip_address = "false"
    tags {
    Name = "instance-private"
  }
}
