output "aws_public_subnet" {
  description = "vpc public_subnet for attachment ec2"
  value       = aws_subnet.public_subnet.id
}

output "aws_ec2_access_allow_ip" {
  description = "allow ip for attachment ec2"
  value       = aws_security_group.allow_http.id
}
