output "ollama_url" {
  value = "http://${ovh_cloud_project_kube.mycluster.nodes_url}:30080"
}


