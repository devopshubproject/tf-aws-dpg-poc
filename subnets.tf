##################################################
# Public Subnet
##################################################

resource "aws_subnet" "pub_subnet" {
  count = 2
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = elements(var.pub_subnet_cidr, count.index)
  availability_zone       = elements(var.availability_zones, count.index)
  map_public_ip_on_launch = true

  tags     = local.common_tags
}


##################################################
# Public Subnet
##################################################

resource "aws_subnet" "pvt_subnet" {
  count = 2
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = elements(var.pvt_subnet_cidr, count.index)
  availability_zone       = elements(var.availability_zones, count.index)
  map_public_ip_on_launch = false

  tags     = local.common_tags
}