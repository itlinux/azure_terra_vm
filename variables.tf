
# Location to spin up your env use "az account list-locations  -o table"
variable location {
}

# Resource group check them out like az group list
variable resource_group {
}

# Prefix to add to your services
variable "prefix" {
  description = "This prefix will be included in the name of most resources."
}

# Web Page Msg
variable "web_msg" {
}


variable "specs" {
  # must select a region that supports availability zones
  # https://docs.microsoft.com/en-us/azure/availability-zones/az-overview
  default = {
    apache = {
      region             = "westus2"
      azs                = ["1"]
      application_count  = 3
      environment        = "apache"
      cidr               = "10.0.0.0/8"
      ltm_instance_count = 2
      gtm_instance_count = 1
      owner              = "Remo Mattei"
    }
    nginx = {
      region             = "westus2"
      azs                = ["1"]
      application_count  = 4
      environment        = "nginx"
      cidr               = "10.0.0.0/8"
      ltm_instance_count = 2
      gtm_instance_count = 0
      owner              = "Remo Mattei"
      #azs                = ["1","3"]
    }
    default = {
      region             = "westus2"
      azs                = ["1"]
      application_count  = 2
      environment        = "apache/nginx"
      cidr               = "10.0.0.0/8"
      ltm_instance_count = 1
      gtm_instance_count = 1
      owner              = ""
    }
  }
}

variable "specs_name" {
  default     = "default"
  description = "name of the map within specification to use for the build"
}

#Network CIDR
variable "network_cidr" {
  default = ["10.0.0.0/16"]
}
#Network Name
variable "network_name" {
  description = "Network Name for the desire env"
}
#PublicIP Name
variable "public_ip_name" {
}
variable "subnet_name" {
}

#Subnet you want to use
variable "subnet_prefix" {
  description = "The address prefix to use for the subnet."
}

#Nic Name
variable "nic_name" {
}
#Nic Config Name
variable "nic_config_name" {
}
#name of the disk
variable "os-disk" {
}
#number of VMs
variable "number_of_vm" {
  description = "Do not add quote on this value"
}

# Storage Tier level use "az storage account list -o table |grep westus2" to just show westus2
# more info https://docs.microsoft.com/en-us/azure/storage/common/storage-account-overview
variable "tier_level" {
}

variable "replication_type" {
}

variable "env_tag" {
}

variable "vm_name" {
}

# VM size use the following "az disk list -o table" to see what size you want
variable "vm_size" {
}
# Storage type
variable "account_type" {
}

# AZ will need a diff user than admin
variable "user_name" {
}
#
#public key
variable "public_key" {
}

variable "caching" {
}

# the next few options can be found using the following "az vm image list --output table"
variable "os_publisher" {
}
variable "offer" {
}

variable "sku_id" {
}

variable "version_to_use" {
}
#computer name
variable "comp_name" {
}

#To disable Password for your VM
variable "password_disable" {
}
#
# Those options below were for AWS dynamic ports
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
