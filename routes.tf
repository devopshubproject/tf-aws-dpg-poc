
resource "aws_route_table" "pub_rt" {
    vpc_id = aws_vpc.vpc.id
  
}

resource "aws_route_table" "pvt_rt" {
    vpc_id = aws_vpc.vpc.id
  
}

resource "aws_route" "pub_igw_r" {
    route_table_id = aws_route_table.pub_rt.id
    nat_gateway_id = aws_internet_gateway.igw.id
    destination_cidr_block = "0.0.0.0/0" 
  
}
resource "aws_route" "pvt_nat_r" {
  route_table_id         = aws_route_table.pvt_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gtw.id
}

resource "aws_route_table_association" "pub_r_ass" {
    route_table_id = aws_route_table.pub_rt.id
    subnet_id = aws_subnet.pub_subnet.id
  
}

resource "aws_route_table_association" "pvt_r_ass" {
    route_table_id = aws_route_table.pvt_rt.id
    subnet_id = aws_subnet.pvt_subnet.id
  
}