
# Location to spin up your env use "az account list-locations  -o table"
variable location {
  default = "westus2"
}

# Resource group check them out like az group list
variable resource_group {
  default = "remo_tf_rg"
}

# Prefix to add to your services
variable "prefix" {
  default     = "remo-tf"
  description = "This prefix will be included in the name of most resources."
}

#Network CIDR
variable "network_cidr" {
  default = ["10.0.0.0/16"]
}
#Network Name
variable "network_name" {
  default = "remo_tf_Vnet"
}
#PublicIP Name
variable "public_ip_name" {
  default = "remo_PublicIP"
}
variable "subnet_name" {
  default = "remo_tf_Subnet"
}

#Subnet you want to use
variable "subnet_prefix" {
  description = "The address prefix to use for the subnet."
  default     = ["10.0.1.0/24"]
}

#Nic Name
variable "nic_name" {
  default = "remo_tf_NIC"
}
#Nic Config Name
variable "nic_config_name" {
  default = "remo_tf_nic_config"
}
#name of the disk
variable "os-disk" {
  default = "remo_disk"
}

# Storage Tier level use "az storage account list -o table |grep westus2" to just show westus2
# more info https://docs.microsoft.com/en-us/azure/storage/common/storage-account-overview
variable "tier_level" {
  default = "Standard"
}

variable "replication_type" {
  default = "LRS"
}

variable "env_tag" {
  default = "Terraform Demo"
}

variable "vm_name" {
  default = "remo_vm"
}

# VM size use the following "az disk list -o table" to see what size you want
variable "vm_size" {
  default = "Standard_DS1_v2"
}
# Storage type
variable "account_type" {
  default = "Premium_LRS"
}

# AZ will need a diff user than admin
variable "user_name" {
  default = "remouser"
}
#
#
#public key
variable "public_key" {
  default = "~/.ssh/openstack.pub"
}

# this is under my Mac home directory
# variable "sshkey" {
#   default = "${file("${var.public_key}.pub")}"
# }

variable "caching" {
  default = "ReadWrite"
}

# the next few options can be found using the following "az vm image list --output table"
variable "os_publisher" {
  default = "OpenLogic"
}
variable "offer" {
  default = "CentOS"
}

variable "sku_id" {
  default = "7.5"
}

variable "version_to_use" {
  default = "latest"
}
#computer name
variable "comp_name" {
  default = "centosremotf"
}

#To disable Password for your VM
variable "password_disable" {
  default = "true"
}
#
# variable "accessip" {
#   default = "0.0.0.0/0"
# }

# variable "service_ports" {
#   default = [
#     {
#       from_port = "22",
#       to_port   = "22"
#       name      = "ssh"
#     },
#     {
#       from_port = "80",
#       to_port   = "80"
#       name      = "HTTP"
#     },
#     {
#       from_port = "443"
#       to_port   = "443"
#       name      = "HTTPS"
#     }
#   ]
# }
