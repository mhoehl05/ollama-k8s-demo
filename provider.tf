provider "ovh" {
  endpoint           = "ovh-eu"
  application_key    = var.ovh_application_key
  application_secret = var.ovh_application_secret
  consumer_key       = var.ovh_consumer_key
}

provider "helm" {
  kubernetes {
    config_path = "./kubeconfig.yaml"
  }

  depends_on = [
    output.kubeconfig_file
  ]
}