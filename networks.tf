# Create virtual network
resource "azurerm_virtual_network" "remo_tf_network" {
  name                = var.network_name
  address_space       = var.network_cidr
  location            = var.location
  resource_group_name = azurerm_resource_group.remo_tf_rg.name

  tags = {
    environment = var.env_tag
  }
}

# Create subnet
resource "azurerm_subnet" "remo_tf_subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.remo_tf_rg.name
  virtual_network_name = azurerm_virtual_network.remo_tf_network.name
  address_prefixes     = var.subnet_prefix
}


# Create public IPs
resource "azurerm_public_ip" "remo_tf_public_ip" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = azurerm_resource_group.remo_tf_rg.name
  allocation_method   = "Dynamic"

  tags = {
    environment = var.env_tag
  }
}

# Create network interface
resource "azurerm_network_interface" "remo_tf_nic" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = azurerm_resource_group.remo_tf_rg.name

  ip_configuration {
    name                          = var.nic_config_name
    subnet_id                     = azurerm_subnet.remo_tf_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.remo_tf_public_ip.id
  }
  tags = {
    environment = var.env_tag
  }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.remo_tf_nic.id
  network_security_group_id = azurerm_network_security_group.remo_tf_security_gr.id
}

