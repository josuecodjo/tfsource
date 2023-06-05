resource "kubernetes_namespace" "first" {
  metadata {
    name = "${var.my_ns}-namespace"
  }
}
