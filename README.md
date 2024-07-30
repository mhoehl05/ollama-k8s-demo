# ollama-k8s-demo
Helmchart and terraform code to deploy a managed k8s cluster and install a working webui for communication with ollama models.


# GPU specifications: https://www.ovhcloud.com/en/public-cloud/gpu/
# Possible options (check in portal): https://www.ovhcloud.com/en/public-cloud/prices/


# GRA7
- t1-le-45 (1xV100)
- t1-le-90 (2xV100)
- t1-le-180 (4xV100)

# Schritt für Schritt:

- kubectl installieren: choco install kubernetes-cli -y
- kubeconfig herunterladen bei OVH
- Datei verschieben nach C:\Users\%USERNAME%\.kube
- Datei umbenennen in config

# Test: 
- kubectl get pods -A -o wide
- kubectl get pod -n ollama
- kubectl get pod -A
- kubectl top node
- Ollama pod suchen: z.B. ollama-84f99b7c84-f5pmd
- kubectl exec ollama-84f99b7c84-f5pmd -n ollama -- nvidia-smi

 while ($true) {
    kubectl exec ollama-84f99b7c84-f5pmd -n ollama -- nvidia-smi
    kubectl top node
    Start-Sleep -Seconds 1  # Pause für 1 Sekunde zwischen den Ausführungen, anpassen nach Bedarf
}
