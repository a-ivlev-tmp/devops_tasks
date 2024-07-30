variable "kind_cluster_config_path" {
  type        = string
  description = "The location where this cluster's kubeconfig will be saved to."
  default     = "~/code/just_tests/test_kind/config"
}

variable "app_namespace" {
  type        = string
  description = "Application namespace (it will be created if needed)."
  default     = "app"
}