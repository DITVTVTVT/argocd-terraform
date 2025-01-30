
module "argocd_dev" {
  source        = "./terraform_argocd_mk8s"
  cluster_name  = "demo-dev"
  chart_version = "7.7.22"
}

module "argocd_prod" {
  source        = "./terraform_argocd_mk8s"
  cluster_name  = "demo-prod"
  chart_version = "7.7.22"
}

module "argocd_dev_root" {
  source             = "./terraform_argocd_root_mk8s"
  cluster_name       = "demo-dev"
  git_source_path    = "demo-dev/applications"
  git_source_repoURL = "git@github.com:DITVTVTVT/argocd.git"
}

module "argocd_prod_root" {
  source             = "./terraform_argocd_root_mk8s"
  cluster_name       = "demo-prod"
  git_source_path    = "demo-prod/applications"
  git_source_repoURL = "git@github.com:DITVTVTVT/argocd.git"
}