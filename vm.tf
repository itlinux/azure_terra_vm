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
  name                  = var.vm_name
  resource_group_name   = azurerm_resource_group.remo_tf_rg.name
  location              = var.location
  network_interface_ids = [azurerm_network_interface.remo_tf_nic.id]
  size                  = var.vm_size

  admin_ssh_key {
    username   = var.user_name
    public_key = file("${var.public_key}")
  }


  os_disk {
    name                 = var.os-disk
    caching              = var.caching
    storage_account_type = var.account_type
  }

  source_image_reference {
    publisher = var.os_publisher
    offer     = var.offer
    sku       = var.sku_id
    version   = var.version_to_use
  }

  computer_name                   = var.comp_name
  admin_username                  = var.user_name
  disable_password_authentication = var.password_disable


  tags = {
    environment = var.env_tag
  }
}
