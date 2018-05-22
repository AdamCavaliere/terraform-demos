variable "network_name" {
  description = "Name of the Network"
  default     = "notSet"
}

variable "environment" {
  description = "Environment Type - dev, stage, prod"
  default     = "notSet"
}

variable "region" {
  description = "Region for network to be deployed"
  default     = "us-east-2"
}
