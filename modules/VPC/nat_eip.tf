resource "aws_eip" "nat_eip" {
  vpc = true

  tags = {
    "Name" = "${var.enviroment}-nat-eip"
  }
} 
