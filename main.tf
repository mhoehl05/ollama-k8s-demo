resource "ovh_cloud_project_kube" "mycluster" {
  service_name = var.service_name
  name         = var.cluster_name
  region       = var.region
}

resource "ovh_cloud_project_kube_nodepool" "node_pool" {
  service_name   = ovh_cloud_project_kube.mycluster.service_name
  kube_id        = ovh_cloud_project_kube.mycluster.id
  name           = "my-pool-1" //Warning: "_" char is not allowed!
  flavor_name    = var.flavor_name
  desired_nodes  = 1
  max_nodes      = 1
  min_nodes      = 1
  monthly_billed = false

  template {
    metadata {
      labels = {
       "nvidia.com/mig.config"="all-1g.${var.mig_size}"
      }
    }
    spec {
      unschedulable = false
    }
  }
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
  content  = templatefile("${path.module}/values.tftpl", { 
    small_slice_count = var.small_slice_count, 
    large_slice_count = var.large_slice_count, 
    max_requests      = var.max_requests 
    })
  filename = "${path.module}/helmchart/ollama-demo-helmchart/values.yaml"
}

resource "helm_release" "ollama_demo" {
  name             = "ollama-demo-helmchart"
  chart            = "./helmchart/ollama-demo-helmchart"
  namespace        = "ollama"
  create_namespace = true
  wait             = true

  depends_on = [
    ovh_cloud_project_kube_nodepool.node_pool,
    local_file.ollama_values
  ]
}