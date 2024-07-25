resource "ovh_cloud_project_kube" "mycluster" {
  service_name = "f17cf6a8b8b14b08a4958b53dc8105a5"
  name         = "my_kube_cluster"
  region       = "GRA11"
}

resource "ovh_cloud_project_kube_nodepool" "node_pool" {
  service_name   = "f17cf6a8b8b14b08a4958b53dc8105a5"
  kube_id        = ovh_cloud_project_kube.mycluster.id
  name           = "my-pool-1" //Warning: "_" char is not allowed!
  flavor_name    = "l4-90"
  desired_nodes  = 1
  max_nodes      = 1
  min_nodes      = 1
  monthly_billed = false
}

