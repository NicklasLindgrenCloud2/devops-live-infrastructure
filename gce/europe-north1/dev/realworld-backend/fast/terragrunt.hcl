# include is a block, so make sure NOT to include an equals sign
include {
  path = find_in_parent_folders()
}


terraform {
  source = "git@github.com:NicklasLindgrenCloud2/devops-realworld-example-backend.git//terraform/backend?ref=4770a9272f3a795a9bc767f10deb2e18a5ef988d"
}


dependency "kubernetes" {
  config_path = "../../common/kubernetes"
}

inputs = {
  kubernetes_host                   = dependency.kubernetes.outputs.endpoint
  kubernetes_client_key             = dependency.kubernetes.outputs.client_key
  kubernetes_client_certificate     = dependency.kubernetes.outputs.client_certificate
  kubernetes_cluster_ca_certificate = dependency.kubernetes.outputs.cluster_ca_certificate
  pod_scale                         = 1
  ext_database                      = false
}
