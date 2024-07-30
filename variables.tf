variable "ovh_application_key" {
  type = string
}

variable "ovh_application_secret" {
  type = string
}

variable "ovh_consumer_key" {
  type = string
}



# GPU specifications: https://www.ovhcloud.com/en/public-cloud/gpu/
# Possible options: https://www.ovhcloud.com/en/public-cloud/prices/


variable "flavor_name" {
  type        = string
  default     = "l4-90"
  description = "flavor name that defines the size of the work node (needs to be gpu enabled and default to cheapest gpu flavor)"
}
