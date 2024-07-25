output "kubeconfig_file" {
  content   = ovh_cloud_project_kube.mycluster.kubeconfig
  filename  = "kubeconfig.yaml"
  sensitive = true
}

output "nodes_url" {
  value = ovh_cloud_project_kube.mycluster.nodes_url
}
