# ------------------------------------------------------------------------------
# Outputs
# ------------------------------------------------------------------------------
output "private_key" {
  value     = tls_private_key.ssh.private_key_pem
  sensitive = true
}

output "private_key_filename" {
  value = local_sensitive_file.private_key.filename
}

output "public_key" {
  value = tls_private_key.ssh.public_key_openssh
}

output "public_key_filename" {
  value = local_file.public_key.filename
}
