resource "tls_private_key" "key1" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "key1" {
  key_name   = "ec2-key"
  public_key = tls_private_key.key1.public_key_openssh
}
resource "local_file" "private_key" {
  sensitive_content = tls_private_key.key1.private_key_pem
  filename          = "${path.module}/ec2-key.pem"
  file_permission   = "0600"
}
