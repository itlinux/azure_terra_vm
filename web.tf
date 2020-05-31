resource "azurerm_virtual_machine_extension" "apache" {
  depends_on           = [azurerm_linux_virtual_machine.it_tf_vm]
  name                 = "apache"
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"
  count                = var.number_of_vm
  virtual_machine_id   = azurerm_linux_virtual_machine.it_tf_vm[count.index].id
  settings             = <<SETTINGS
 {
  "commandToExecute": "sudo yum install -y httpd &&  systemctl --now enable httpd && echo ${var.web_msg} >/var/www/html/index.html"
 }
SETTINGS
}
