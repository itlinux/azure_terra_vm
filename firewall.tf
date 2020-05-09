resource "azurerm_network_security_group" "remo_tf_security_gr" {
  location            = var.location
  resource_group_name = azurerm_resource_group.remo_tf_rg.name
  name                = "${var.prefix}-sg"

  # resource "azurerm_sql_firewall_rule" "myfirewall" {
  #   dynamic "ingress" {
  #     for_each = [for s in var.service_ports : {
  #       from_port = s.from_port
  #       to_port   = s.to_port
  #       name      = s.name
  #     }]

  #     content {
  #       from_port             = ingress.value.from_port
  #       to_port               = ingress.value.to_port
  #       name                  = infewaa.value.name
  #       protocol              = "tcp"
  #       source_address_prefix = [var.accessip]
  #       access                = "Allow"
  #     }
  #   }

  security_rule {
    name                       = "HTTP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "HTTPS"
    priority                   = 102
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "SSH"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

