

# Create NAT Gateway in AZ1
resource "aws_nat_gateway" "nat_gateway_az1" {
  allocation_id = aws_eip.nat_eip_az1.id
  subnet_id     = aws_subnet.public_subnet_az1.id
}

# Create NAT Gateway in AZ2
resource "aws_nat_gateway" "nat_gateway_az2" {
  allocation_id = aws_eip.nat_eip_az2.id
  subnet_id     = aws_subnet.public_subnet_az2.id
}

# Elastic IP for NAT Gateway in AZ1
resource "aws_eip" "nat_eip_az1" {
  domain = "vpc"
}

# Elastic IP for NAT Gateway in AZ2
resource "aws_eip" "nat_eip_az2" {
  domain = "vpc"
}