variable "instance_count" {
  description = "number of VMs"
  default     = "2"
}

variable "network_workspace" {
  description = "Workspace to reference for network resources"
}

variable "app_name" {
  description = "application name"
  default     = "Not Set"
}
