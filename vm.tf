# Generate random text for a unique storage account name
resource "random_id" "randomId" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group = azurerm_resource_group.remo_tf_rg.name
  }

  byte_length = 8
}
#
# Create storage account for boot diagnostics
resource "azurerm_storage_account" "remo_tf_storage" {
  name                     = "diag${random_id.randomId.hex}"
  resource_group_name      = azurerm_resource_group.remo_tf_rg.name
  location                 = var.location
  account_tier             = var.tier_level
  account_replication_type = var.replication_type

  tags = {
    environment = var.env_tag
  }
}


resource "azurerm_linux_virtual_machine" "remo_tf_vm" {
  count                 = var.number_of_vm
  name                  = "${var.vm_name}_num_${count.index + 1}"
  location              = var.location
  size                  = var.vm_size
  resource_group_name   = azurerm_resource_group.remo_tf_rg.name
  network_interface_ids = [element(azurerm_network_interface.remo_tf_nic.*.id, count.index)]

  admin_ssh_key {
    username   = var.user_name
    public_key = file("${var.public_key}")
  }

  os_disk {
    name                 = "${var.os-disk}-${count.index + 1}"
    caching              = var.caching
    storage_account_type = var.account_type
  }

  source_image_reference {
    publisher = var.os_publisher
    offer     = var.offer
    sku       = var.sku_id
    version   = var.version_to_use
  }

  computer_name                   = title("${var.comp_name}-${count.index + 1}")
  admin_username                  = var.user_name
  disable_password_authentication = var.password_disable


  tags = {
    environment = var.env_tag
  }
}
