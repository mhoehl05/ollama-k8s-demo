output "kubeconfig_file" {
  value     = ovh_cloud_project_kube.mycluster.kubeconfig
  sensitive = true
}

output "nodes_url" {
  value       = ovh_cloud_project_kube.mycluster.nodes_url
}
