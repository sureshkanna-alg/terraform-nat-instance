variable "region" {
  default = "us-west-2"
}
variable "vpc_cidr" {
  default = "192.170.0.0/16"
}
variable "subnet_cidr" {
  type = "list"
  default = ["192.170.1.0/24","192.170.2.0/24"]
}
variable "azs" {
  type = "list"
  default = ["us-west-2a","us-west-2b"]
}
variable "amis" {
  type = "list"
  default = ["ami-0032ea5ae08aa27a2","ami-d874e0a0"]
}
variable "instance_type" {
  default = "t2.micro"
}
variable "num_private_instances" {
  default = "1"
}
variable "num_nat_instances" {
  default = "1"
}
variable "key_name" {
  default = "ec2key"
}
# data "aws_availability_zones" "available" {}
