locals {
  gpu_count = 2
}


resource "ovh_cloud_project_kube" "mycluster" {
  service_name = "f17cf6a8b8b14b08a4958b53dc8105a5"
  name         = "my_kube_cluster"
  region       = "GRA11"
}

resource "ovh_cloud_project_kube_nodepool" "node_pool" {
  service_name   = "f17cf6a8b8b14b08a4958b53dc8105a5"
  kube_id        = ovh_cloud_project_kube.mycluster.id
  name           = "my-pool-1" //Warning: "_" char is not allowed!
  flavor_name    = "l4-180"
  desired_nodes  = 1
  max_nodes      = 1
  min_nodes      = 1
  monthly_billed = false
}

resource "helm_release" "gpu_operator" {
  name             = "nvidia-gpu-operator"
  repository       = "https://helm.ngc.nvidia.com/nvidia"
  chart            = "gpu-operator"
  namespace        = "gpu-operator"
  create_namespace = true
  wait             = true

  depends_on = [
    ovh_cloud_project_kube_nodepool.node_pool
  ]
}

resource "local_file" "ollama_values" {
  content  = templatefile("${path.module}/values.tftpl", { gpu_count = local.gpu_count })
  filename = "${path.module}/helmchart/ollama-demo-helmchart/values.yaml"
}

resource "helm_release" "ollama_demo" {
  name             = "ollama-demo-helmchart"
  chart            = "./helmchart/ollama-demo-helmchart"
  namespace        = "ollama"
  create_namespace = true

  depends_on = [
    ovh_cloud_project_kube_nodepool.node_pool,
    local_file.ollama_values
  ]
}

