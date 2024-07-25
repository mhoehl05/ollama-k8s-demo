terraform {
  cloud {
    organization = "controlware-AI-playground"

    workspaces {
      name = "ovh_k8s_infrastructure"
    }
  }

  required_providers {
    ovh = {
      source = "ovh/ovh"
    }
  }
}