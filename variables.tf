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

variable "max_requests" {
  type        = string
  default     = 4
  description = "max amount of request that can be made parallel to a ollama pod"
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

variable "service_name" {
  type        = string
  default     = "f17cf6a8b8b14b08a4958b53dc8105a5"
  description = "Name of the OVH service (subscription)"
}



