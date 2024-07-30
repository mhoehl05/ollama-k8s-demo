variable "ovh_application_key" {
  type = string
}

variable "ovh_application_secret" {
  type = string
}

variable "ovh_consumer_key" {
  type = string
}



# GPU specifications: https://www.ovhcloud.com/en/public-cloud/gpu/
# Possible options (check in portal): https://www.ovhcloud.com/en/public-cloud/prices/


variable "flavor_name" {
  type        = string
  default     = "l4-180"
  description = "flavor name that defines the size of the work node (needs to be gpu enabled and default to cheapest gpu flavor)"
}

# GRA7
# t1-le-45 (1xV100)
# t1-le-90 (2xV100)
# t1-le-180 (4xV100)

# choco install kubernetes-cli -y
# Schritt 1: kubeconfig herunterladen
# Datei verschieben nach C:\Users\%USERNAME%\.kube
# Datei umbenennen in config
# Test: kubectl get pod -n ollama
# kubectl get pod -A
# kubectl top node
# Ollama pod suchen: z.B. ollama-84f99b7c84-f5pmd
# kubectl exec ollama-84f99b7c84-f5pmd -n ollama -- nvidia-smi
/*
 while ($true) {
    kubectl exec ollama-84f99b7c84-f5pmd -n ollama -- nvidia-smi
    kubectl top node
    Start-Sleep -Seconds 1  # Pause für 1 Sekunde zwischen den Ausführungen, anpassen nach Bedarf
}
*/

