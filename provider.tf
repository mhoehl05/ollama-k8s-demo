provider "ovh" {
  endpoint           = "ovh-eu"
  application_key    = var.ovh_application_key
  application_secret = var.ovh_application_secret
  consumer_key       = var.ovh_consumer_key
}

provider "helm" {
  kubernetes {
    host                   = ovh_cloud_project_kube.mycluster.kubeconfig_attributes[0].host
    client_certificate     = base64decode(ovh_cloud_project_kube.mycluster.kubeconfig_attributes[0].client_certificate)
    client_key             = base64decode(ovh_cloud_project_kube.mycluster.kubeconfig_attributes[0].client_key)
    cluster_ca_certificate = base64decode(ovh_cloud_project_kube.mycluster.kubeconfig_attributes[0].cluster_ca_certificate)
  }
}