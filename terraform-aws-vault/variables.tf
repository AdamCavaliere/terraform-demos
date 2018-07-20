variable "azs" {
  description = "Availability Zones"
  default     = ""
}

variable "aws_region" {
  description = "Region to launch instances"
  default     = "us-east-2"
}

variable "app_name" {
  description = "Application Name"
  default     = "notSet"
}

variable "domain_root" {
  description = "Root of domain for site"
}

variable "network_workspace" {
  description = "Network workspace to utilize"
  default     = "notSet"
}

variable "aws_role" {
  description = "Role for creating resources"
  default     = "notSet"
}

variable "aws_path" {
  description = "Path for reading the credentials"
  default     = "notSet"
}
