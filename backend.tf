# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
  backend "kubernetes" {
    config_path      = "~/.kube/config"
    load_config_file = true
    namespace        = "super-secure-ns-terraform"
    secret_suffix    = "src"
  }
}
