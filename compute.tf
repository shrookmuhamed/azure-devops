resource "aws_instance" "bastion_host" {
  ami             = "ami-080e1f13689e07408"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.subnet1.id
  vpc_security_group_ids = [aws_security_group.ssh_sg.id]
  key_name        = aws_key_pair.key1.key_name
  associate_public_ip_address = true 

  user_data = <<-EOF
#!/bin/bash
mkdir -p /home/ubuntu/.ssh
echo "${tls_private_key.key1.private_key_pem}" > /home/ubuntu/.ssh/id_rsa
chmod 600 /home/ubuntu/.ssh/id_rsa
chown ubuntu:ubuntu /home/ubuntu/.ssh/id_rsa
EOF

  tags = {
    Name = "BastionHost"
  }
}
resource "aws_instance" "app_server" {
  ami             = "ami-080e1f13689e07408"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.subnet2.id
   vpc_security_group_ids = [aws_security_group.ssh-3000.id]
  key_name        = aws_key_pair.key1.key_name
  

  tags = {
    Name = "AppServer"
  }
}
