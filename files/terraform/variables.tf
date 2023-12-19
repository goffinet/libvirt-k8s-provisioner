variable "network_autostart" {
  description = "Whether to autostart the libvirt network"
  type        = bool
  default     = true
}

variable "network_name" {
  description = "Name of the libvirt network"
  type        = string
}

variable "network_mode" {
  description = "Mode of the libvirt network"
  type        = string
  default     = "nat"
}

variable "network_domain" {
  description = "Domain of the libvirt network"
  type        = string
  default     = null
}

variable "network_cidr" {
  description = "CIDR for the libvirt network"
  type        = list(string)
  default = [ "192.168.122.0/24" ]
}

variable "network_bridge" {
  description = "Bridge for the libvirt network"
  type        = string
  default = null
}

variable "network_mtu" {
  description = "MTU for the libvirt network"
  type        = number
  default = null
}

variable "network_dhcp_enabled" {
  description = "Whether DHCP is enabled for the libvirt network"
  type        = bool
  default     = false
}

variable "network_dhcp_local" {
  description = "Whether DHCP is local-only for the libvirt network"
  type        = bool
  default     = false
}

variable "network_dnsmasq_options" {
  description = "Map of dnsmasq options for the libvirt network"
  type        = map(string)
  default = {}
}

variable "network_dns_entries" {
  description = "Map of DNS entries for the libvirt network"
  type        = map(string)
  default = {}
}

variable "network_routes" {
  description = "Map of routes for the libvirt network (format CIDR = gateway --> '10.0.0.1/24' = '10.0.0.1' )"
  type        = map(string)
  default = {}
}

variable "pool_name" {
  description = "Name of the libvirt pool"
  type        = string
}

variable "pool_path" {
  description = "Path for the libvirt pool"
  type        = string
  default = "/var/lib/libvirt/images"
}


variable "instance_count" {
  type = number
  default = 1
  description = "Number of instances to create"
}

variable "instance_cloud_image" {
  type = string
  description = "Cloud image to use for instance provisioning"
  default = ""
}

variable "instance_iso_image" {
  type = string
  description = "ISO to use for instance provisioning"
  default = ""
}

variable "instance_additional_volume_size" {
  type = number
  description = "Additional block device size"
  default = 0
}

variable "instance_cloudinit_path" {
  type = string
  description = "cloud-init config to use for instance provisioning"
  default = "./cloud_init.cfg"
}

variable "instance_type" {
  type = string
  description = "Instance type, Windows/Linux"
  default = "linux"
}

variable "instance_hostname" {
  type = string
  default = "service-vm"
  description = "Hostname to assign the istance via cloud-init"
}

variable "instance_domain" {
  type = string
  default = "example.com"
  description = "Hostname to assign the istance via cloud-init"
}

variable "instance_cpu" {
  type = number
  default = 2
  description = "Number of CPUs to configure for the instance"
}

variable "instance_memory" {
  type = number
  default = 4
  description = "Instance memory size, in GB"
}

variable "instance_volume_size" {
  type = number
  default = 20
  description = "Instance memory size, in GB"
}

variable "instance_cloud_user" {
  type = object({
    username = string
    password = string
    sshkey = optional(string)
  })

  default = {
    username = "sysadmin"
    password = "redhat"
    sshkey = ""
  }
}

variable "instance_libvirt_network" {
  type = string
  description = "The libvirt network to attach the instance to"
  default = "default"
}

variable "instance_libvirt_pool" {
  type = string
  description = "The libvirt pool to attach the instance to"
  default = "default"
}

variable "instance_uefi_enabled" {
  type = bool
  default = true
  description = "Set this to true if OS should be installed via ISO"
}

variable "instance_network_interfaces" {
  type = list(object({
    interface_network = string
    interface_mac_address = string
    interface_addresses = list(string)
    interface_hostname = string
    interface_wait_for_lease = bool
  })
  )
  default = []
  description = "A list of network interfaces to add to the instance"
}
