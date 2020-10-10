resource "azurerm_virtual_machine_extension" "webserver" {
  depends_on           = [azurerm_linux_virtual_machine.it_tf_vm]
  name                 = "webserver"
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"
  count                = var.specs[terraform.workspace]["vm_count"]
  virtual_machine_id   = azurerm_linux_virtual_machine.it_tf_vm[count.index].id
  settings             = <<SETTINGS
 {
  "commandToExecute": "sudo yum install -y epel-release && yum install -y ${var.specs[terraform.workspace]["webserver"]} &&  systemctl --now enable ${var.specs[terraform.workspace]["webserver"]}&& echo ${var.web_msg} > ${var.specs[terraform.workspace]["htmllocation"]}"
 }
SETTINGS
}
