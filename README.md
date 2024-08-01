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

Fragen und tasks:

- Shared pvc?
- Wie teilt man gpus auf?
https://docs.google.com/document/d/1mdgMQ8g7WmaI_XVVRrCvHPFPOMCm5LQD5JefgAh6N8g/edit

https://www.scaleway.com/en/docs/compute/gpu/how-to/use-mig-with-kubernetes/

https://towardsdatascience.com/dynamic-mig-partitioning-in-kubernetes-89db6cdde7a3

kubectl label nodes nodenamehier nvidia.com/mig.config=all-1g.10gb --overwrite
(alle pods die gpus benötigen müssen gelöscht werden)
Status überprüfen mit:
kubectl logs nodenamehier -n gpu-operator
kubectl get node nodenamehier -oyaml | grep nvidia

label mig.state muss auf success sein
label für gpuproduct muss danach wie folgt aussehen: gpuname + migconfig BSP: NVIDIA-A100-80GB-PCIe-MIG-1g.10gb

danach besitzt die node x beliebige slices die vom pod als eingeständige gpus interpretiert werden.
- Selfhosting vs ChatGPT monthly preise vergleichen
- Welche deployment methoden gibt es?
Ollama operator können das deployment vereinfachen. Models können in kubernetes yaml files oder helm charts definiert werden.
https://ollama-operator.ayaka.io/pages/en/guide/overview.html