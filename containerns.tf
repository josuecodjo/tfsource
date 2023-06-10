resource "kubernetes_namespace" "ns" {

  metadata {
    name = "${var.my_ns}-namespace-${var.how_many}"
    annotations = {}
    labels = {
      "app.kubernetes.io/managed-by" = "Terraform"
      custom                         = var.label ? "my-custom-label" : ""
    }
  }
}


resource "kubernetes_pod" "mycontainer" {

  for_each = var.mycontainer
  metadata {
    name = each.value["podname"]
    namespace = "${var.my_ns}-namespace-${var.how_many}"
    labels = merge( each.value["labels"] ,{
      "type" = "std-container"
      "app.kubernetes.io/managed-by" = "Terraform"
    })
  }

  spec {
    container {
      image = each.value["image"]
      name  = each.value["name"]

      port {
        container_port = each.value["port"]
      }
    }
  }
  depends_on = [
    kubernetes_namespace.ns
  ]
}
