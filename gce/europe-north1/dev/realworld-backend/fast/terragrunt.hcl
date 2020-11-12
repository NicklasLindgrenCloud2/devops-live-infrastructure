# include is a block, so make sure NOT to include an equals sign
include {
  path = find_in_parent_folders()
}


terraform {
  source = "git@github.com:NicklasLindgrenCloud2/devops-realworld-example-backend.git//terraform/backend?ref=eae95865383152fa1ad9493ef7da3f3dbd6d39ab"
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
