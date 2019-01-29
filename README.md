# Example of terraform

```
provider "aws" {
  access_key = "AWS key put here"
  secret_key = "AWS secret put here"
  region     = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = "ami-032509850cf9ee54e"
  instance_type = "t2.nano"
  subnet_id     = "${aws_subnet.us-west-2a-public.id}"
}

resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
}

resource "aws_subnet" "us-west-2a-public" {
  vpc_id = "${aws_vpc.example.id}"
  cidr_block = "10.0.1.0/25"
  availability_zone = "us-west-2a"
}

output "ip" {
  value = "${aws_instance.example.public_ip}"
}

```
