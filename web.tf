# resource "azurerm_virtual_machine_extension" "apache" {
#   depends_on           = [azurerm_linux_virtual_machine.it_tf_vm]
#   name                 = "apache"
#   publisher            = "Microsoft.Azure.Extensions"
#   type                 = "CustomScript"
#   type_handler_version = "2.0"
#   count                = var.number_of_vm
#   virtual_machine_id   = azurerm_linux_virtual_machine.it_tf_vm[0].id
#   settings             = <<SETTINGS
# {
#   "commandToExecute": "sudo  bash -c 'yum install -y epel-release && yum install -y nginx &&  systemctl --now enable nginx && echo ${var.web_msg} > /usr/share/nginx/html/index.html'"
# }
# SETTINGS
# }
