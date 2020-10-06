output "Public_IPs" {
  description = "Public IP addresses."
  value       = azurerm_linux_virtual_machine.it_tf_vm.*.public_ip_address
}
output "private_ip" {
  value = azurerm_linux_virtual_machine.it_tf_vm.*.private_ip_address
}
output "username" {
  value = azurerm_linux_virtual_machine.it_tf_vm.0.admin_username
}
output "sshkey" {
  value = azurerm_linux_virtual_machine.it_tf_vm.0.admin_ssh_key
}

output mgmt_fqdn {
  value = azurerm_public_ip.it_tf_public_ip.*.fqdn
}
