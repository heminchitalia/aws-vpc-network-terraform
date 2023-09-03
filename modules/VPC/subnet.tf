resource "aws_subnet" "eks_public_subnets" {
  count                   = length(var.public_subnets)
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = element(var.public_subnets, count.index)
  map_public_ip_on_launch = true
  availability_zone       = element(var.public_az, count.index)

  tags = {
    "Name" = "${var.enviroment}-public-subnet-${element(var.public_az, count.index)}"
  }
}

resource "aws_subnet" "eks_private_subnets" {
  count             = length(var.private_subnet)
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = element(var.private_subnet, count.index)
  availability_zone = element(var.private_az, count.index)

  tags = {
    "Name" = "${var.enviroment}-private-subnet-${element(var.private_az, count.index)}"
  }
}