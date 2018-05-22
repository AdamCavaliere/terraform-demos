variable "network_workspace" {
  description = "Network workspace to utilize"
  default     = "notSet"
}

variable "environment" {
  description = "Environment Type - dev, stage, prod"
  default     = "notSet"
}

variable "aws_region" {
  description = "Region for network to be deployed"
  default     = "us-east-2"
}

variable "application_name" {
  description = "Application Name"
  default     = "notSet"
}
