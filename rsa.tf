resource "tls_private_key" "pvt_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ssh" {
  key_name = "loginkey"
  public_key = tls_private_key.pvt_key.public_key_openssh
}
