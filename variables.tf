variable "ovh_application_key" {
  type = string
}

variable "ovh_application_secret" {
  type = string
}

variable "ovh_consumer_key" {
  type = string
}

variable "flavor_name" {
  type        = string
  default     = "l4-90"
  description = "flavor name that defines the size of the work node (needs to be gpu enabled and default to cheapest gpu flavor)"
}

variable "gpu_count" {
  type        = number
  default     = 1
  description = "amount of gpus per node"
}

variable "region" {
  type        = string
  default     = "GRA11"
  description = "region of the cluster"
}

variable "cluster_name" {
  type        = string
  default     = "my_kube_cluster"
  description = "name of the cluster"
}



