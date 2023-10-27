##################################################
# Public Route Table
##################################################

resource "aws_route_table" "pub_rt" {
    vpc_id = aws_vpc.vpc.id
  
}

##################################################
# Private Route Table
##################################################

resource "aws_route_table" "pvt_rt" {
    vpc_id = aws_vpc.vpc.id
  
}

##################################################
# Public Route For IGW
##################################################

resource "aws_route" "pub_igw_r" {
    route_table_id = aws_route_table.pub_rt.id
    gateway_id = aws_internet_gateway.igw.id
    destination_cidr_block = "0.0.0.0/0" 
  
}

##################################################
# Private Route For NGW
##################################################

resource "aws_route" "pvt_nat_r" {
  route_table_id         = aws_route_table.pvt_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gtw[0].id
}

##################################################
# Public Route Table Assocation
##################################################

resource "aws_route_table_association" "pub_r_ass" {
    count = length(aws_subnet.pub_subnet)
    route_table_id = aws_route_table.pub_rt.id
    subnet_id = aws_subnet.pub_subnet[count.index].id
  
}

##################################################
# Private Route Table Assocation
##################################################

resource "aws_route_table_association" "pvt_r_ass" {
    count = length(aws_subnet.pvt_subnet)
    route_table_id = aws_route_table.pvt_rt.id
    subnet_id = aws_subnet.pvt_subnet[count.index].id
  
}