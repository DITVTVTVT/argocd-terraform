# data "aws_eks_cluster" "this" {
#   name = var.eks_cluster_name
# }
#
# data "aws_eks_cluster_auth" "this" {
#   name = var.eks_cluster_name
# }

provider "kubernetes" {
  config_context_cluster = var.cluster_name
  config_path            = "~/.kube/config"
}

resource "kubernetes_manifest" "argocd_root" {
  manifest = yamldecode(templatefile("${path.module}/root.yaml", {
    path = var.git_source_path
    repoURL = var.git_source_repoURL
    targetRevision = var.git_source_targetRevision
  }))
}