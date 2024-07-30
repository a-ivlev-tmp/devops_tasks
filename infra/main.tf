resource "kind_cluster" "default" {
  name = "demo-cluster"
  wait_for_ready = true
  kubeconfig_path = pathexpand(var.kind_cluster_config_path)
  kind_config {
    kind = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    node {
      role = "control-plane"

      extra_port_mappings {
        container_port = 30000
        host_port      = 80
      }
    }
  }
}
