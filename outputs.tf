##################################################
# Outputs
##################################################

output "pip" {
  value = aws_launch_configuration.ec2_launch.associate_public_ip_address
}

output "ssh_private_key_pem" {
  sensitive = true
  value = tls_private_key.pvt_key.private_key_pem
}

output "ssh_public_key_pem" {
  value = tls_private_key.pvt_key.public_key_pem
}