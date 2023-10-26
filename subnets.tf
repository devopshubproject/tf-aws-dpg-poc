##################################################
# Public Subnet
##################################################

resource "aws_subnet" "pub_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.pub_subnet_cidr
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = true

  tags     = local.common_tags
}


##################################################
# Public Subnet
##################################################

resource "aws_subnet" "pvt_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.pvt_subnet_cidr
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = false

  tags     = local.common_tags
}