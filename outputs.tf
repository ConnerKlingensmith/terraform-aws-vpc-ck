output "vpc_id" {
  value = aws_vpc.challenge_vpc.id
}

output "vpc_cidr_block" {
  value = aws_vpc.challenge_vpc.cidr_block
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}

output "nat_gateway_ids" {
  value = aws_nat_gateway[*].id
}

output "internet_gateway_ids" {
  value = aws_internet_gateway.chal-IGW.id
}

output "public_route_table_ids" {
  value = aws_route_table.public.id
}

output "private_route_table_ids" {
  value = aws_route_table.private[*].id
}
