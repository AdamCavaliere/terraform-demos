variable "network_workspace" {
  description = "Network workspace to utilize"
  default     = "notSet"
}

variable "environment" {
  description = "Environment Type - dev, stage, prod"
  default     = "notSet"
}

variable "application_name" {
  description = "Application Name"
  default     = "notSet"
}

variable "ami_id" {
  description = "AMI for launch"
  default     = "ami-03541b04e3b4c1e7e"
}
