# Create virtual network
resource "azurerm_virtual_network" "it_tf_network" {
  name                = var.network_name
  address_space       = var.network_cidr
  location            = var.location
  resource_group_name = data.azurerm_resource_group.it_tf_rg.name

  tags = {
    environment = var.env_tag
  }
}

# Create subnet
resource "azurerm_subnet" "it_tf_subnet" {
  name                 = var.subnet_name
  resource_group_name  = data.azurerm_resource_group.it_tf_rg.name
  virtual_network_name = azurerm_virtual_network.it_tf_network.name
  address_prefix       = var.subnet_prefix
}


# Create public IPs
resource "azurerm_public_ip" "it_tf_public_ip" {
  #name                = var.public_ip_name
  name                = "${var.public_ip_name}-${count.index + 1}"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.it_tf_rg.name
  count               = var.number_of_vm
  allocation_method   = "Dynamic"
  domain_name_label   = "${var.specs[terraform.workspace]["fqdn"]}${count.index}"
  zones               = [element(local.azs, count.index)]
  tags = {
    environment = var.env_tag
  }
}

# Create network interface
resource "azurerm_network_interface" "it_tf_nic" {
  name                = "${var.vm_name}-${count.index + 1}-NIC"
  location            = var.location
  count               = var.number_of_vm
  resource_group_name = data.azurerm_resource_group.it_tf_rg.name

  ip_configuration {
    name                          = var.nic_config_name
    subnet_id                     = azurerm_subnet.it_tf_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = element(azurerm_public_ip.it_tf_public_ip.*.id, count.index)
  }
  tags = {
    environment = var.env_tag
  }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "jointogether_networks" {
  count                     = var.number_of_vm
  network_interface_id      = element(azurerm_network_interface.it_tf_nic.*.id, count.index)
  network_security_group_id = element(azurerm_network_security_group.it_tf_security_gr.*.id, count.index)
}
