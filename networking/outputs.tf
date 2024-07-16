output "aws_vpc_id" {
  value = aws_vpc.this.id
}

output "elastic_ip_nate_gateway_1a_public_ip" {
  value = aws_eip.nat_gateway_1a.public_ip
}

output "elastic_ip_nate_gateway_1b_public_ip" {
  value = aws_eip.nat_gateway_1b.public_ip
}

output "aws_internet_gateway_id" {
  value = aws_internet_gateway.this.id
}

output "aws_nat_gateway_1a_id" {
  value = aws_nat_gateway.us_east_1a.id
}

output "aws_nat_gateway_1a_ip" {
  value = aws_nat_gateway.us_east_1a.public_ip
}

output "aws_nat_gateway_1b_id" {
  value = aws_nat_gateway.us_east_1b.id
}

output "aws_nat_gateway_1b_ip" {
  value = aws_nat_gateway.us_east_1b.public_ip
}
