##################################################
# Nat gateway
##################################################

resource "aws_nat_gateway" "nat_gtw" {
  count = length(aws_subnet.pub_subnet)
  allocation_id = element(var.allocation_id, count.index)
  subnet_id     = aws_subnet.pub_subnet[count.index].id
  depends_on    = [aws_internet_gateway.igw]
  tags          = local.common_tags
}
