output "remo_tf_public_ip" {
  description = "Public IP addresses."
  value       = azurerm_public_ip.remo_tf_public_ip.*.ip_address
}
output "private_ip" {
  value = azurerm_linux_virtual_machine.remo_tf_vm.*.private_ip_address
}
output "username" {
  value = azurerm_linux_virtual_machine.remo_tf_vm.0.admin_username
}
output "sshkey" {
  value = azurerm_linux_virtual_machine.remo_tf_vm.0.admin_ssh_key
}
