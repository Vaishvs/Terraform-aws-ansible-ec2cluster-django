resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "demo_key_pair" {
  key_name   = "cluster_key"
  public_key = tls_private_key.ssh_key.public_key_openssh


   provisioner "local-exec" { # Create a "myKey.pem" to your computer!!
    command = "echo '${tls_private_key.ssh_key.private_key_pem}' > ./myKey.pem && chmod 400 myKey.pem"
  }
}

