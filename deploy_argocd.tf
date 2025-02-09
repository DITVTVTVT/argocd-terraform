
module "argocd_dev" {
  source           = "terraform_argocd_eks"
  eks_cluster_name = "demo-dev"
  chart_version    = "5.46.2"
}

module "argocd_prod" {
  source           = "terraform_argocd_eks"
  eks_cluster_name = "demo-prod"
  chart_version    = "5.39.1"
}