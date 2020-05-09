
output "public_ip" {
  value = azurerm_linux_virtual_machine.remo_tf_vm.public_ip_address
}
output "private_ip" {
  value = azurerm_linux_virtual_machine.remo_tf_vm.private_ip_address
}
output "username" {
  value = azurerm_linux_virtual_machine.remo_tf_vm.admin_username
}
output "sshkey" {
  value = azurerm_linux_virtual_machine.remo_tf_vm.admin_ssh_key
}
