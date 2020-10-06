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
  "commandToExecute": "sudo yum install -y httpd &&  systemctl --now enable httpd && echo ${var.web_msg} >/var/www/html/index.html && curl -o /tmp/onboard_agent.sh https://raw.githubusercontent.com/Microsoft/OMS-Agent-for-Linux/master/installer/scripts/onboard_agent.sh && sh /tmp/onboard_agent.sh -w ${var.workspaceid} -s ${var.sharedkeyid} -d opinsights.azure.com"
 }
SETTINGS
}



