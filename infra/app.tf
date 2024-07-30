resource "helm_release" "app" {
  name       = "app"
  chart      = "./task3"

  namespace        = var.app_namespace
  create_namespace = true

  depends_on = [kind_cluster.default]
}