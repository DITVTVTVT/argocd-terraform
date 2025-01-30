# Module to deploy ArgoCD ROOT Applicaiton to MK8S

Example to use:

```
module "argocd_root" {
  source             = "./terraform_argocd_root_mk8s"
  cluster_name   = "demo-dev"
  git_source_path    = "demo-dev/applications"
  git_source_repoURL = "git@github.com:DITVTVTVT/argocd.git"
}
```