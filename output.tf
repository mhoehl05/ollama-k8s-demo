output "nodes_url" {
  value = ovh_cloud_project_kube.mycluster.nodes_url
}

resource "local_sensitive_file" "kubeconfig" {
  sensitive_content = ovh_cloud_project_kube.mycluster.kubeconfig
  filename             = "${path.module}/files/kubeconfig.yaml"
  file_permission      = 0777
  directory_permission = 0777
}

