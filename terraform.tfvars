location         = "westus2"
resource_group   = "remo_itlinux_tf_rg"
prefix           = "remo-tf"
network_cidr     = ["10.0.0.0/16"]
network_name     = "remo_tf_Vnet"
public_ip_name   = "remo_PublicIP"
subnet_name      = "remo_tf_Subnet"
subnet_prefix    = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
nic_name         = "remo_tf_NIC"
nic_config_name  = "remo_tf_nic_config"
os-disk          = "remo_disk"
number_of_vm     = 2 # this is a string no quote
tier_level       = "Standard"
replication_type = "LRS"
env_tag          = "Terraform Demo"
vm_name          = "remo_vm"
vm_size          = "Standard_DS1_v2"
account_type     = "Premium_LRS"
public_key       = "~/.ssh/openstack.pub" # Use full path if needed
caching          = "ReadWrite"
os_publisher     = "OpenLogic"
offer            = "CentOS"
sku_id           = "7.5"
version_to_use   = "latest"
comp_name        = "centosremotf"
password_disable = "true"
user_name        = "remouser"
web_msg          = "This is a Demo Page"
