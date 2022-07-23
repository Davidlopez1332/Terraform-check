data "aws_subnet" "az_1" {
    availability_zone    = "us-west-2a"
}

data "aws_subnet" "az_2" {
    availability_zone    = "us-west-2b"
}
data "aws_subnet" "az_3" {
    availability_zone    = "us-west-2c"
}

data "aws_vpc" "default" {
  default = true
}