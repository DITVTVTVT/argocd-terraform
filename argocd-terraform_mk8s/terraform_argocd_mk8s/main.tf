# data "cluster" "this" {
#   name = var.cluster_name
# }

# data "aws_eks_cluster_auth" "this" {
#   name = var.cluster_name
# }

provider "helm" {
  kubernetes {
    config_context_cluster = var.cluster_name
    config_path            = "~/.kube/config"
  }
}

resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm" # Official Chart Repo
  chart            = "argo-cd"                              # Official Chart Name
  namespace        = "argocd"
  timeout          = 500
  version          = var.chart_version
  create_namespace = true
  values           = [file("${path.module}/argocd.yaml")]
}