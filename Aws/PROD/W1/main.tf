# PROVIDER CONFIGURATION
provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

# VM CONFIGURATION
resource "aws_instance" "web" {
  ami                    = "ami-493f2f29"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-1f164c78"
  vpc_security_group_ids = ["sg-06515d7f"]

  tags {
    "Identity" = "NWI-041818-eagle"
    "Name"     = "MB"
    "Company"  = "HRB"
  }
}

output "public_ip" {
  value = "${aws_instance.web.public_ip}"
}

output "public_dns" {
  value = "${aws_instance.web.public_dns}"
}
