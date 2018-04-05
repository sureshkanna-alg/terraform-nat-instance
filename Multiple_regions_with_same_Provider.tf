provider "aws" {
  # Default to Oregon
  region = "us-west-2"
}

provider "aws" {
  alias = "oregon"
  region = "us-west-2"
}

provider "aws" {
  alias = "mumbai"
  region = "ap-south-1"
}


resource "aws_vpc" "main1" {
  provider = "aws.oregon"
  cidr_block       = "190.170.0.0/16"
  tags {
    Name = "kanna1"
  }
}


resource "aws_vpc" "main2" {
  provider = "aws.mumbai"
  cidr_block       = "190.171.0.0/16"
  tags {
    Name = "kanna"
  }
}
