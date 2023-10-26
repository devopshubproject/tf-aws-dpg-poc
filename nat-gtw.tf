resource "aws_nat_gateway" "nat_gtw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.pub_subnet.id
  depends_on    = [aws_internet_gateway.igw]
  tags          = local.common_tags
}
