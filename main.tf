locals {
  owners      = var.office
  environment = var.environment
  name        = "${var.office}-${var.environment}"
  common_tags = {
    owners      = local.owners
    environment = local.environment
  }
  eks_cluster_name = var.cluster_id
}

resource "helm_release" "metrics_server_release" {
  name       = "${var.cluster_name}-metrics-server"
  repository = "https://kubernetes-sigs.github.io/metrics-server/"
  chart      = "metrics-server"
  namespace  = "kube-system"
}


