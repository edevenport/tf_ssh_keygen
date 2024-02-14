# ------------------------------------------------------------------------------
# Resources
# ------------------------------------------------------------------------------
resource "tls_private_key" "ssh" {
  algorithm = var.algorithm
}

resource "local_sensitive_file" "private_key" {
  content         = tls_private_key.ssh.private_key_openssh
  filename        = "${path.root}/${var.ssh_key_path}/id_${lower(var.algorithm)}"
  file_permission = "0600"
}

resource "local_file" "public_key" {
  content         = tls_private_key.ssh.public_key_openssh
  filename        = "${path.root}/${var.ssh_key_path}/id_${lower(var.algorithm)}.pub"
  file_permission = "0600"
}
