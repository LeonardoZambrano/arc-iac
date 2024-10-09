output "vpc_id" {
  description = "vpc_id"
  value       = aws_vpc.VPCITMKubernetes.id
}
output "subnet_1_id" {
  description = "subnet_1_id"
  value       = aws_subnet.SUBNETPublic1ITMKubernetes.id
}
output "subnet_2_id" {
  description = "subnet_2_id"
  value       = aws_subnet.SUBNETPublic2ITMKubernetes.id
}
output "route_table_id" {
  description = "route_table_id"
  value       = aws_route_table.ROUTABITMKubernetes.id
}
output "ig_id" {
  description = "internet_gateway_id"
  value       = aws_internet_gateway.IGWITMKubernetes.id

}
